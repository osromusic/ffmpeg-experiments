@echo off
setlocal

for %%a in ("*.raw") do (
  set "filename=%%~na"

  REM Part A: Raw to Video, Scaling, Color Shift, Interpolation, Blur
  ffmpeg -y -f rawvideo -pix_fmt yuv420p -video_size 320x240 -r 25 -i "%filename%.raw" -c:v libvpx -qmin 1 -qmax 20 -crf 16 -t 7 "%filename%_v4.webm"
  ffmpeg -y -i "%filename%_v4.webm" -filter_complex "[0:v]scale=width=800:height=600,rgbashift=rh=50:gv=-50:bv=25,elbg=codebook_length=56[out_v]" -map "[out_v]" -b:v 1k "%filename%_stretch-shift_v4.webm"
  ffmpeg -y -i "%filename%_stretch-shift_v4.webm" -filter:v "setpts=60*PTS,minterpolate=fps=25:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=16" -c:v libvpx "%filename%_slow-microcolor_v4.webm"
  ffmpeg -y -i "%filename%_slow-microcolor_v4.webm" -vf "gblur=steps=4" -c:v libx264 "%filename%_RawVP8-decimv4-micolor.mp4"

  REM Part B: 4x4 Grid (Optimized)
  ffmpeg -y -i "%filename%_RawVP8-decimv4-micolor.mp4" -filter_complex "[0:v]split=4[v1][v2][v3][v4];[v1]hflip[fh1];[v2]hflip[fh2];[v3]vflip[fv3];[v4]vflip[fv4];[fh1][fh2]hstack=inputs=2[top];[fv3][fv4]hstack=inputs=2[bottom];[top]vflip[topv];[bottom]vstack=inputs=2[4x4]" -map "[4x4]" -c:v libx264 "4x4_%filename%.mp4"
  ffmpeg -y -i "4x4_%filename%.mp4" -vf "scale=iw*0.66:ih*0.66,sab=cr=4:cs=100" -c:v libx264 "%filename%_scaled_blurred.mp4"

  REM Part C: Smoothing, Negation, Time Blur, Color Correction (Optimized)
  ffmpeg -y -i "%filename%_scaled_blurred.mp4" -filter_complex "[0:v]scale=iw/2:ih/2,gblur=sigma=5,negate,tblend=all_mode=average:shortest=1,framestep=2,eq=saturation=3:gamma=3:contrast=3[out]" -map "[out]" "%filename%_vp-mintyv4x4-smooth-motion-negate.mp4"

)

endlocal
pause
@echo off

REM multi command script to process a raw file into video, motioninterpolate, create a 4x4 grid, then smooth the results and apply some saturation

for %%a in ("*.raw") do (

REM this is part A converting the raw into video

  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 320x240 -r 25 -i "%%~na.raw" -c:v libvpx -qmin 1 -qmax 20 -crf 16 -t 7 "%%~na_v4.webm"
  ffmpeg -i "%%~na_v4.webm" -filter_complex "[0:v]scale=width=800:height=600,rgbashift=rh=50:gv=-50:bv=25,elbg=codebook_length=56[out_v]" -map "[out_v]" -b:v 1k "%%~na_stretch-shift_v4.webm"
  ffmpeg -i "%%~na_stretch-shift_v4.webm" -filter:v "setpts=60*PTS,minterpolate=fps=25:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=16" -c:v libvpx "%%~na_slow-microcolor_v4.webm"
  ffmpeg -i "%%~na_slow-microcolor_v4.webm" -vf "gblur=steps=4" -c:v libx264 "%%~na_RawVP8-decimv4-micolor.mp4"

REM this is Part B the 4x4 grid

ffmpeg -i "%%~na_RawVP8-decimv4-micolor.mp4" -vf hflip -c:v libx264 "temp_fh1_%%~na.mp4"
ffmpeg -i "%%~na_RawVP8-decimv4-micolor.mp4" -vf hflip -c:v libx264 "temp_fh3_%%~na.mp4"

ffmpeg -i "%%~na_RawVP8-decimv4-micolor.mp4" -i "temp_fh1_%%~na.mp4" -filter_complex "[0:v][1:v]hstack=inputs=2" -c:v libx264 "temp_top_%%~na.mp4"
ffmpeg -i "%%~na_RawVP8-decimv4-micolor.mp4" -i "temp_fh3_%%~na.mp4" -filter_complex "[0:v][1:v]hstack=inputs=2" -c:v libx264 "temp_bottom_%%~na.mp4"

ffmpeg -i "temp_top_%%~na.mp4" -c:v libx264 "temp_topv_%%~na.mp4"

ffmpeg -i "temp_bottom_%%~na.mp4" -vf vflip -c:v libx264 "temp_bottomv_%%~na.mp4"

ffmpeg -i "temp_topv_%%~na.mp4" -i "temp_bottomv_%%~na.mp4" -filter_complex "[0:v][1:v]vstack=inputs=2" -c:v libx264 "4x4_%%~na.mp4"

del "temp_fh1_%%~na.mp4" "temp_fh3_%%~na.mp4" "temp_top_%%~na.mp4" "temp_bottom_%%~na.mp4" "temp_topv_%%~na.mp4" "temp_bottomv_%%~na.mp4"	

ffmpeg -i "4x4_%%~na.mp4" -vf "scale=iw*0.66:ih*0.66,sab=cr=4:cs=100" -c:v libx264 "%%~na_scaled_blurred.mp4"

REM this is Part C which takes the 4x4, smooths through a process of scaling and blur, blends a negated copy, time blurs, color fixes to remove black

  ffmpeg -i "%%~na_scaled_blurred.mp4" -filter_complex "[0:v]scale=iw/2:ih/2[downscaled];[downscaled]gblur=sigma=5[blurred];[blurred]negate[inverted];[inverted]tblend=all_mode=average,framestep=2[time_blurred];[time_blurred]eq=saturation=3:gamma=3[saturated];[saturated]eq=saturation=3:contrast=3[saturated2]" -map "[saturated2]" "%%~na_vp-mintyv4x4-smooth-motion-negate.mp4"

)
pause
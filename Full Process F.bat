@echo off

for %%a in ("*.raw") do (

  REM Part A: Raw to Video, Interpolation, Color Adjustments
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 64x36 -r 25 -i "%%~na.raw" -c:v libvpx -crf 28 -t 21 "%%~na_v4.webm"
  ffmpeg -i "%%~na_v4.webm" -filter_complex "[0:v]scale=width=640:height=360,rgbashift=rh=50:gv=-50:bh=25,elbg=codebook_length=35[out_v]" -map "[out_v]" -b:v 1k "%%~na_stretch-shift_v4.webm"
  ffmpeg -i "%%~na_stretch-shift_v4.webm" -filter:v "setpts=60*PTS,minterpolate=fps=30:mb_size=16:search_param=600:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=16:weights='1 1 1 1 1 1 1 1'" -c:v libvpx "%%~na_slow-microcolor_v4.webm"
  ffmpeg -i "%%~na_slow-microcolor_v4.webm" -vf "setpts=0.5*PTS" -c:v libx264 "%%~na_RawVP8-PC.mp4"

  REM Part B: XOR Blend and 4x4 Grid

  	ffmpeg -i "%%~na_RawVP8-PC.mp4" -ss 1 -i "%%~na_RawVP8-PC.mp4" -filter_complex "[0:v][1:v]blend=all_mode=xor[xor]" -map "[xor]" "%%~na_xor.mp4"
	ffmpeg -i "%%~na_xor.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack[out];[out]fps=30[out2]" -map "[out2]" "%%~na_4x4.mp4"

)
pause
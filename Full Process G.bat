@echo off

for %%a in ("*.raw") do (

  REM Part A: Raw to Video, Interpolation, Color Adjustments
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 64x36 -r 25 -i "%%~na.raw" -c:v libvpx -crf 18 -t 21 "%%~na_v4.webm"
  ffmpeg -i "%%~na_v4.webm" -filter_complex "[0:v]scale=width=640:height=360,elbg=codebook_length=35[out_v]" -map "[out_v]" -c:v libx264 -b:v 20k "%%~na_stretch-shift_v4.mp4"
  ffmpeg -i "%%~na_stretch-shift_v4.mp4" -filter:v "setpts=20*PTS,minterpolate=fps=30:mb_size=16:search_param=600:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=4:weights='1 1 1 1'" -c:v libx264 -b:v 10k "%%~na_minty1.mp4"
  ffmpeg -i "%%~na_minty1.mp4" -filter:v "crop=320:180,setpts=20*PTS,minterpolate=fps=30:mb_size=16:search_param=600:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=8:weights='1 1 1 1 1 1 1 1'" -c:v libx264 -b:v 5k -t 600 "%%~na_minty2.mp4"  
  ffmpeg -i "%%~na_minty2.mp4" -filter:v "crop=160:90,setpts=20*PTS,minterpolate=fps=30:mb_size=16:search_param=600:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=16:weights='1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1'" -c:v libx264 -b:v 1k -t 1200 "%%~na_mintyG3.mp4"
  ffmpeg -i "%%~na_mintyG3.mp4" -vf "scale=640:360,setpts=0.5*PTS" -c:v libx264 "%%~na_RawVP8-MintyG3x.mp4"

  REM Part B: XOR Blend
  ffmpeg -i "%%~na_RawVP8-MintyG3x.mp4" -ss 1 -i "%%~na_RawVP8-MintyG3x.mp4" -filter_complex "[0:v][1:v]blend=all_mode=hardoverlay[hardover]" -map "[hardover]" "%%~na_G3hover.mp4"  

  REM Part C: 4x4 Grid
  ffmpeg -i "%%~na_G3hover.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack[out];[out]fps=30[out2]" -map "[out2]" "%%~na_4x4.mp4"
  ffmpeg -i "%%~na_4x4.mp4" -filter:v "crop=640:360,scale=1920:1080" -c:v libx264 "%%~na_pG.mp4"
)
pause
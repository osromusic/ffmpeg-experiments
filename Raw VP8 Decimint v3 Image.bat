@echo off
for %%a in ("*.raw") do (
  ffmpeg -f rawvideo -pix_fmt gray -video_size 512x512 -r 25 -i "%%~na.raw" -c:v libvpx -qmin 1 -qmax 20 -crf 16 -t 1 "%%~na_v3.webm"
  ffmpeg -i "%%~na_v3.webm" -vf "crop=32:32,scale=1024:1024" -b:v 1k "%%~na_stretch_v3.webm"
  ffmpeg -i "%%~na_stretch_v3.webm" -loop 1 -i image.jpg -filter_complex "blend=all_mode=multiply" -t 1 "%%~na_stretch-image_v3.webm"
  ffmpeg -i "%%~na_stretch-image_v3.webm" -filter:v "setpts=50*PTS,minterpolate=fps=25:scd=none:mi_mode=mci:mc_mode=aobmc:me=umh:vsbmc=1:mb_size=8:search_param=400,tmix=frames=16" -c:v libvpx "%%~na_slow_v3.webm"
  ffmpeg -i "%%~na_slow_v3.webm" -c:v libx264 "%%~na_RawVP8-image-decimint_v3.mp4"
)
pause
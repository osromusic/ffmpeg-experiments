@echo off
for %%a in (*.raw) do (
  ffmpeg -f rawvideo -pix_fmt rgb24 -s 320x240 -r 25 -i "%%~na.raw" -c:v libx264 "%%~na_raw.mp4"
  ffmpeg -i "%%~na_raw.mp4" -vcodec libx264 -b:v 1K "%%~na_raw-1k.mp4"
  ffmpeg -i "%%~na_raw-1k.mp4" -vcodec libx264 -vf "crop=32:32,scale=1024:768,setdar=16:9" "%%~na_deci-zoom.mp4"
  del "%%~na_raw.mp4"
)
pause
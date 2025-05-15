@echo off
for %%a in ("*.raw") do (
  ffmpeg -f rawvideo -pix_fmt gray -video_size 800x600 -r 25 -i "%%~na.raw" -c:v libvpx "%%~na.webm"
  ffmpeg -i "%%~na.webm" -vf "crop=32:24,scale=800:600" -b:v 1k "%%~na_cropped.webm"
  ffmpeg -i "%%~na_cropped.webm" -filter:v "setpts=50*PTS,minterpolate=fps=25:scd=none:mi_mode=mci:mc_mode=aobmc:me=umh:vsbmc=1:mb_size=8:search_param=400,tmix=frames=16" -c:v libvpx "%%~na_slow.webm"
  ffmpeg -i "%%~na_slow.webm" -c:v libx264 "%%~na_RawVP8-decimint.mp4"
)
pause
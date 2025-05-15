@echo off
for %%a in (*.raw) do ffmpeg -f rawvideo -pix_fmt rgb24 -s 640x480 -r 25 -i "%%~na.raw" -c:v libx264 "%%~na.mp4"
pause
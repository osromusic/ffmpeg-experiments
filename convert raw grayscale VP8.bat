@echo off
for %%a in (*.raw) do ffmpeg -f rawvideo -pix_fmt gray -video_size 640x480 -r 25 -i "%%~na.raw" -c:v libvpx "vp8gray2_%%~na.webm"
pause
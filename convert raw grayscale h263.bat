@echo off
for %%a in (*.raw) do ffmpeg -f rawvideo -pix_fmt gray -video_size 352x288 -r 25 -i "%%~na.raw" -c:v h263 "h263_%%~na.avi"
pause
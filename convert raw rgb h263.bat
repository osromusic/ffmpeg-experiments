@echo off
for %%a in (*.raw) do ffmpeg -f rawvideo -pix_fmt rgb24 -video_size 352x288 -r 25 -i "%%~na.raw" -c:v h263 "h263rgb_%%~na.avi"
pause
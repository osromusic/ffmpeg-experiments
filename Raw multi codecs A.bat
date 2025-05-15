@echo off
for %%a in (*.raw) do (

ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v libvpx -crf 16 -t 7 "%%~na_v4.webm"
ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v libx264 -crf 16 -preset medium -t 7 "%%~na_x264.mp4"
ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v mpeg4 -b:v 1M -t 7 "%%~na_mpeg4.mp4"
ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v libtheora -qscale:v 5 -t 7 "%%~na_theora.ogv"
ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v msmpeg4v2 -b:v 1M -t 7 "%%~na_msmpeg4v2.avi"
)

pause
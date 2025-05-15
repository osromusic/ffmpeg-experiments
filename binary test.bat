@echo off
ffmpeg -f lavfi -i testsrc=size=800x600:rate=1:duration=10 -vf format=gray -c:v rawvideo -pix_fmt gray "binary.yuv"
pause
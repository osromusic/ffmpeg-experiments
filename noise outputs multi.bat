@echo off
ffmpeg -f lavfi -i color=white:s=800x600 -vf "noise=alls=20:allf=t+u" -t 10 "noise.mp4"
ffmpeg -f lavfi -i frei0r=pixeliz0r -t 10 "frei0r.mp4"
ffmpeg -f lavfi -i life=size=800x600:mold=2:rate=25:ratio=0.1 -t 10 "life.mp4"
ffmpeg -f lavfi -i mandelbrot=size=800x600:rate=25 -t 10 "mandelbrot.mp4"
pause
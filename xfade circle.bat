@echo off

ffmpeg -i "A.mp4" -i "B.mp4" -filter_complex "xfade=transition=circleclose:duration=60:offset=280" -c:v libx264 -t 550 "output_blend.mp4"

pause
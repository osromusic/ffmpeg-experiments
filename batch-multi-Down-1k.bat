for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 1K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_1kDeci.mp4"
pause
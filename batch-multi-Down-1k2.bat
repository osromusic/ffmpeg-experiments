for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 1K "E:\Glitch Video\VHS\down-grader\%%~na_1kDeci.mp4"
pause
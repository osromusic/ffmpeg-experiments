pause
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 1K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_0001kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 5K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_0005kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 10K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_0010kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 50K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_0050kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 100K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_0100kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 500K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_0500kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 1000K -t 00:00:15.0 "E:\Glitch Video\VHS\down-grader\%%~na_1000kDeci.mp4"
pause
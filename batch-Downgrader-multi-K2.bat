pause
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 1K "F:\Glitch_Video\3com\multi-down\%%~na_01kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 5K "F:\Glitch_Video\3com\multi-down\%%~na_05kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 10K "F:\Glitch_Video\3com\multi-down\%%~na_10kDeci.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 50K "F:\Glitch_Video\3com\multi-down\%%~na_50kDeci.mp4"
pause
pause
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 1K "F:\Glitch_Video\Text\multi1510\%%~na_01k.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 5K "F:\Glitch_Video\Text\multi1510\%%~na_05k.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264 -b:v 10K "F:\Glitch_Video\Text\multi1510\%%~na_10k.mp4"
pause
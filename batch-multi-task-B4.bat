for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=and" "F:\Glitch_Video\locam\%%a-and.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=or" "F:\Glitch_Video\locam\%%a-or.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=divide" "F:\Glitch_Video\locam\%%a-divi.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=xor" "F:\Glitch_Video\locam\%%a-xor.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=burn" "F:\Glitch_Video\locam\%%a-burn.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=dodge" "F:\Glitch_Video\locam\%%a-dodg.mp4"
pause

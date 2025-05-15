for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -ss 0.040 -i "%%~na.mp4" -vcodec libx264 -b:v 2000K -filter_complex "[0:v][1:v] blend=exclusion" -r 20  "F:\gg\Exclusion-Ufinex_%%~na.mp4"
pause
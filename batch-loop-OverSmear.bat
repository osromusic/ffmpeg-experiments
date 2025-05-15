for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -ss 0.001 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=overlay" "oversmear_%%~na.mp4"
pause
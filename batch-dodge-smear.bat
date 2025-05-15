for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.500 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=dodge" "%%~na_dodg.mp4"
pause
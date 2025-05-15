for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 1.000 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=or" "%%~na_or.mp4"
pause
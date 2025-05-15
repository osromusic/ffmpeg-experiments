for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.001 -i "%%~na.mp4" -vcodec libx264 -b:v 500k -filter_complex "[0:v][1:v] blend=divide" "F:\gg\pix-dod\divixxx\DIVIxxx_%%~na.mp4"
pause
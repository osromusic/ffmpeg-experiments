for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=divide" "E:\Glitch Video\VHS\divi\Divi-x_%%~na.mp4"
pause
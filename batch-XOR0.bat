for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.001 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=xor" "G:\SxBx\merge\XOR_%%~na.mp4"
pause
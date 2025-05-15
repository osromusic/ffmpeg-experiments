for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -ss 00:00:00.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=xor" "G:\RumpStretch\multi-process\%%~na_xor2.mp4"
pause
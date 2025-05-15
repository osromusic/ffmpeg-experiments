@echo off

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -ss 1 -i "%%~na.mp4" -filter_complex "[0:v][1:v]blend=all_mode=xor[xor]" -map "[xor]" "%%~na_sharp-xor.mp4"

pause



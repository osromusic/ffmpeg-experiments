@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -f lavfi -i "frei0r=morpho_str" -filter_complex "[1:v]morpho=mode=erode:planes=0:iterations=2:threshold=0.5" "%%~na_erosion.mp4"
pause
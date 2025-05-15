@echo off

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -filter:v "setpts=0.50*PTS" "%%~na_speedup2x.mp4"

pause
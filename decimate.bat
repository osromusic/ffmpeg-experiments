@echo off

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -c:v libx264 -crf 30 -b:v 1k "%%~na_deci.mp4"

pause
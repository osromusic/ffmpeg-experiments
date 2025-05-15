@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vf "hue=s=180" "%%~na_hue180.webm"
pause
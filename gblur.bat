@echo off
for %%a in ("*.webm") do ffmpeg -i "%%~na.webm" -vf "gblur=steps=4" -c:v libx264 -f mp4 "%%~na_gblur4.mp4"
pause
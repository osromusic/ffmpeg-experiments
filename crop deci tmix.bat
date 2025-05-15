@echo off
for %%a in ("*.avi") do ffmpeg -i "%%a"  -filter:v "crop=64:48,scale=352:288,tmix=frames=16" -c:v libx264 -b:v 1k "cropdeci-tmix_%%~na.mp4"
pause
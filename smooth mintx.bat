@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%a"  -filter:v "setpts=0.5*PTS,tmix=frames=32" -c:v libx264 "smooth-mintx%%~na.mp4"
pause
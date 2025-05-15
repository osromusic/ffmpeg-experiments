@echo off

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vf "setpts=0.5*PTS" "%%~na_2x.mp4"

pause
@echo off

REM motion blur entire clip by huge amount, lower min thresh for further blur .001 .0001

for %%a in ("*.mp4") do	ffmpeg -i "%%~na.mp4" -vf "setpts=1.25*PTS,tmix=frames=32:weights='1 1 1 1 1 1 1 1'" "%%~na_moblurX1.mp4"

pause
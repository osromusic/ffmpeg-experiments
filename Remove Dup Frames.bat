@echo off

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vf "mpdecimate,setpts=N/FRAME_RATE/TB,showinfo" %%~na_no_dupes.mp4"

pause



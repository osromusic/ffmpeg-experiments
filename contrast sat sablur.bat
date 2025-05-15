@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vf "eq=saturation=3.0:gamma=3,sab=cr=4:cs=100,curves=preset=increase_contrast" "%%~na_sat-blur.mp4"
pause
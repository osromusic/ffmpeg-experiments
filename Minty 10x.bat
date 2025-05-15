@echo off
for %%a in ("*.avi") do ffmpeg -i "%%a" -filter:v "setpts=10*PTS,minterpolate=fps=25:mi_mode=mci:mc_mode=aobmc:me_mode=bidir:vsbmc=1:mb_size=16" -c:v libx264 "minty10x_%%~na.mp4"
pause
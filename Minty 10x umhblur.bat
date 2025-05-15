@echo off
for %%a in ("*.avi") do ffmpeg -i "%%a" -filter:v "boxblur=3:3,setpts=10*PTS,minterpolate=fps=25:mi_mode=mci:mc_mode=aobmc:me=umh:vsbmc=1:search_param=16:scd=none" -c:v libx264 "minty10xphodsblur_%%~na.mp4"
pause
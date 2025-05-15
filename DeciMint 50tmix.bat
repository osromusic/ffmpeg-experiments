@echo off
for %%a in ("*.avi") do ffmpeg -i "%%a"  -filter:v "crop=64:48,setpts=50*PTS,minterpolate=fps=25:mi_mode=mci:mc_mode=aobmc:me=hexbs:vsbmc=1:search_param=16,scale=800:600,tmix=frames=16" -c:v libx264 "decimint50tmix_%%~na.mp4"
pause
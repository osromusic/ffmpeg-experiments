@echo off
for %%a in ("*.avi") do ffmpeg -i "%%a"  -filter:v "crop=64:48,setpts=50*PTS,minterpolate=fps=25:mi_mode=mci:mc_mode=obmc:me=hexbs:vsbmc=1:mb_size=4:search_param=64,scale=800:600" -c:v libx264 "decimintV2-50x%%~na.mp4"
pause
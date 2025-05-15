@echo off
for %%a in ("*.avi") do ffmpeg -i "%%a"  -filter:v "crop=64:48,setpts=50*PTS,scale=800:600,minterpolate=fps=25:mi_mode=mci:mc_mode=obmc:me=hexbs:vsbmc=1:mb_size=4:search_param=2000,tmix=frames=16" -c:v libx264 "decimintV3-50tmix_%%~na_crop-zoom.mp4"
pause
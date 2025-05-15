@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%a"  -filter:v "setpts=50*PTS,minterpolate='fps=25:mb_size=16:search_param=400:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs'" -c:v libx264 "%%~na_minty-v4.mp4"
pause
@echo off

for %%a in ("*.mp4") do	ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]setpts=12*PTS[slowed];[slowed]minterpolate=fps=30:mi_mode=mci:mc_mode=aobmc:me_mode=bidir[out]" -map "[out]" -c:v libx264 "C:\Users\tbasso\Videos\noisedeck\output\%%~na_mint1.mp4"

pause
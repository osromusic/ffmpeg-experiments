@echo off

REM slow video by 10x an interpolate new frames

for %%a in ("*.mp4") do (

	ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]setpts=10*PTS[slowed];[slowed]minterpolate=fps=30:mi_mode=mci:mc_mode=aobmc:me_mode=bidir[out]" -map "[out]" -c:v libx264 "%%~na_slowmint10.mp4"
	
)
pause
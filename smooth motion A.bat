@echo off

REM attempt to smooth motion using higher frame rate and motion interpolate

for %%a in ("*.mp4") do ( 

	ffmpeg -i "%%~na.mp4" -filter:v "fps=50,minterpolate=fps=50:mi_mode=mci:mc_mode=aobmc:me_mode=bilat:me=epzs" -c:v libx264 "%%~na_smoothA.mp4"
)
pause
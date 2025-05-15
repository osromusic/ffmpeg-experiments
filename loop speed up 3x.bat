@echo off

REM speed up video 3x then loop using a forward-reverse pattern to get a desired length

for %%a in ("*.mp4") do ( 

	ffmpeg -i "%%~na.mp4" -filter:v "setpts=0.33*PTS" "%%~na_speedup.mp4"

	ffmpeg -i "%%~na_speedup.mp4" -filter_complex "[0:v]reverse[rev];[0:v][rev]concat=n=2:v=1[loop]" -map "[loop]" -t 400 "%%~na_speed-looped.mp4"

)
pause
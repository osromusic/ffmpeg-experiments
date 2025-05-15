@echo off

for %%a in ("*.mp4") do (

  REM Part C: 4x4 Grid
  ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack[out];[out]fps=30[out2]" -map "[out2]" "C:\Users\tbasso\Videos\noisedeck\output\4x4\%%~na_4x4.mp4"
  )
pause
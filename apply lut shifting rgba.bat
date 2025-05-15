@echo off
setlocal

set "MP4_FILE="
set "CUBE_FILE="

for %%a in ("*.mp4") do set "MP4_FILE=%%a"
for %%b in ("*.cube") do set "CUBE_FILE=%%b"

if not defined MP4_FILE (
  echo No.mp4 file found.
  goto:eof
)

if not defined CUBE_FILE (
  echo No.cube file found.
  goto:eof
)

ffmpeg -i "%MP4_FILE%" -filter_complex "[0:v]lut3d=file=%CUBE_FILE%[lut];[lut]rgbashift=rh='(t\/5)%w':rv='(t\/5)%h':bh='(-t\/5)%w':bv='(-t\/5)%h'[out]" -map "[out]" -c:v libx264 -t 5 "%MP4_FILE:~0,-4%_%CUBE_FILE:~0,-5%_rgbashift.mp4"

endlocal
pause
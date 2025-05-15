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

echo ffmpeg -i "%MP4_FILE%" -filter_complex "[0:v]lut3d=file=%CUBE_FILE%[lut];[lut]hue=h=sin(t/5)*180[out]" -map "[out]" -c:v libx264 "%MP4_FILE:~0,-4%_%CUBE_FILE:~0,-5%.mp4"
ffmpeg -i "%MP4_FILE%" -filter_complex "[0:v]eq=saturation=2:gamma=2:contrast=2[saturated];[saturated]negate[gate];[gate]lut3d=file=%CUBE_FILE%[lut];[lut]hue=h=sin(t/5)*180[out]" -map "[out]" -c:v libx264 "%MP4_FILE:~0,-4%_%CUBE_FILE:~0,-5%_hue-shift.mp4"

endlocal
pause
@echo off
setlocal

for %%a in ("*.mp4") do (
  ffmpeg -i "%%a" -vf "rotate='(2*PI*t)/100:c=none',scale=iw:ih" -t 15 "%%~na_rotate_wrap.mp4"
)

endlocal
pause
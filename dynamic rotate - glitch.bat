@echo off
setlocal

for %%a in ("*.mp4") do (
  ffmpeg -i "%%a" -vf "select=not(mod(n\,3)),setpts=N/FR/TB,rotate='(2*PI*t)/100:c=none',scale=iw:ih" "%%~na_rotate_wrap.mp4"
)

endlocal
pause
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264  -vf "unsharp=7:7:-2:7:7:-2" "%%~na_Blurr.mp4"
pause
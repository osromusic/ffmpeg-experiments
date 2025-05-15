for %%a in ("*.mp4") do  ffmpeg  -i "%%~na.mp4" -vcodec libx264   -an  -vf "crop=1018:570,scale=1024:576,setdar=16:9" "G:\WSPx\sxbx\%%~na_s.mp4"
pause
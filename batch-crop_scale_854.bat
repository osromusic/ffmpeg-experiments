for %%a in ("*.mp4") do  ffmpeg  -i "%%~na.mp4" -vcodec libx264   -an  -vf "crop=853:479,scale=854:480,setdar=16:9" "G:\WSPx\sxbx\%%~na_stretch.mp4"
pause
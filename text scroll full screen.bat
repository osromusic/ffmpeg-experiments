@echo off
ffmpeg -f lavfi -i color=black:s=800x600 -vf "drawtext=fontfile=monospace.ttf:textfile=input.txt:x=0:y=0:fontsize=24:fontcolor=white,scroll=vertical=1" -t 15 output.mp4
pause
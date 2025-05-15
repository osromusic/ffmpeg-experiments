@echo off

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack[out];[out]scale=1920:1080[scaled];[scaled]tmix=frames=8:weights='1 1 1 1 1 1 1 1'[out2]" -map "[out2]" -c:v libx264 -crf 26 "4x4_%%~na.mp4"

pause
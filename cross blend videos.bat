@echo off

for %%a in ("*.mp4") do ffmpeg -i "A.mp4" -i "B.mp4" -filter_complex "[0:v]setpts=PTS-STARTPTS,fade=t=in:st=0:d=5[v1];[1:v]setpts=PTS-STARTPTS,fade=t=out:st=545:d=15[v2];[v1][v2]blend=all_mode=overlay[outv];[outv]trim=end=550[v3]" -map "[v3]" -c:v libx264  "%%~na_blend.mp4"

pause
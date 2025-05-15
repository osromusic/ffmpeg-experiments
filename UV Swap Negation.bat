@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]shuffleplanes=0:2:1[swapped];[swapped]split=2[original][flipped];[flipped]hflip[hflipped];[original][hflipped]blend=all_mode=negation" -t 5 "%%~na_UV-negate.mp4"
pause
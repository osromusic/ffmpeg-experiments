@echo off

for %%a in ("*.mp4") do ffmpeg -i "4x4_%%~na.mp4" -filter_complex "[0:v]scale=iw/2:ih/2[downscaled];[downscaled]gblur=sigma=5[blurred];[blurred]negate[inverted];[inverted]eq=saturation=3:gamma=2[saturated];[saturated]eq=saturation=3:contrast=2[saturated2];[saturated2]scale=1920:1080,crop=1920:1080[finalscale]" -map "[finalscale]" "C:\Users\tbasso\Videos\noisedeck\process cd\output\%%~na_ProCD.mp4"

pause
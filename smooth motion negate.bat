@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]scale=iw/2:ih/2[downscaled];[downscaled]gblur=sigma=5[blurred];[blurred]negate[inverted];[inverted]tblend=all_mode=average,framestep=2[time_blurred];[time_blurred]eq=saturation=3:gamma=3[saturated];[saturated]eq=saturation=3:contrast=3[saturated2]" -map "[saturated2]" "%%~na_smooth-motion-negate.mp4"
pause
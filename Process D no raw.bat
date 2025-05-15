@echo off

REM multi command script to create a 4x4 grid, then smooth the results and apply some saturation and scaling

for %%a in ("*.mp4") do (

REM this is the 4x4 grid

	ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack,tile=2x2:padding=0[out]" -map "[out]" "4x4_%%~na.mp4"

REM this is Part C which takes the 4x4, smooths through a process of scaling and blur, blends a negated copy, time blurs, color fixes to remove black then scales up to HD

	ffmpeg -i "4x4_%%~na.mp4" -filter_complex "[0:v]scale=iw/2:ih/2[downscaled];[downscaled]gblur=sigma=5[blurred];[blurred]negate[inverted];[inverted]tblend=all_mode=average,framestep=2[time_blurred];[time_blurred]eq=saturation=3:gamma=2[saturated];[saturated]eq=saturation=3:contrast=2[saturated2];[saturated2]scale=1280:720[hd]" -map "[hd]" "%%~na_4x4-smooth-negate-D.mp4"

)
pause
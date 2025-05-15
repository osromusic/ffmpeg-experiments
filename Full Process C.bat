@echo off

REM multi command script to process a raw file into video, motioninterpolate, create a 4x4 grid, then smooth the results and apply some saturation

for %%a in ("*.mp4") do (

	ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]crop=32:18[crop],[crop]scale=640:360[scale],[scale]setpts=12*PTS[slowed];[slowed]minterpolate=fps=30:mi_mode=mci:mc_mode=aobmc:me_mode=bidir[blend],[blend]tmix=frames=32:weights='1 1 1 1 1 1 1 1 1'[out]" -map "[out]" -c:v libx264 "%%~na_cropmint.mp4"
	
REM this is Part B the 4x4 grid

	ffmpeg -i "%%~na_cropmint.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack[out]" -map "[out]" "4x4_%%~na.mp4"


REM this is Part C which takes the 4x4, smooths through a process of scaling and blur, blends a negated copy, time blurs, color fixes to remove black


  ffmpeg -i "4x4_%%~na.mp4" -filter_complex "[0:v]scale=iw/2:ih/2[downscaled];[downscaled]gblur=sigma=5[blurred];[blurred]negate[inverted];[inverted]eq=saturation=3:gamma=2[saturated];[saturated]eq=saturation=3:contrast=2[saturated2];[saturated2]scale=1920:1080,crop=1920:1080[finalscale]" -map "[finalscale]" "C:\Users\tbasso\Videos\noisedeck\output\%%~na_ProC.mp4"

)
pause
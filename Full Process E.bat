@echo off

REM multi command script to process a raw file into video, motioninterpolate, create a 4x4 grid, then smooth the results and apply some saturation

for %%a in ("*.raw") do (

REM this is part A converting the raw into video

	ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 64x36 -r 25 -i "%%~na.raw" -c:v libvpx -crf 28 -t 21 "%%~na_v4.webm"
	ffmpeg -i "%%~na_v4.webm" -filter_complex "[0:v]scale=width=640:height=360,rgbashift=rh=50:gv=-50:bh=25,elbg=codebook_length=35[out_v]" -map "[out_v]" -b:v 1k "%%~na_stretch-shift_v4.webm"
	ffmpeg -i "%%~na_stretch-shift_v4.webm" -filter:v "setpts=60*PTS,minterpolate=fps=30:mb_size=16:search_param=600:vsbmc=0:scd=none:mc_mode=aobmc:me_mode=bilat:me=epzs,tmix=frames=16:weights='1 1 1 1 1 1 1 1'" -c:v libvpx "%%~na_slow-microcolor_v4.webm"
	ffmpeg -i "%%~na_slow-microcolor_v4.webm" -vf "setpts=0.5*PTS" -c:v libx264 "%%~na_RawVP8-PC.mp4"

REM this is Part B the 4x4 grid

	ffmpeg -i "%%~na_RawVP8-PC.mp4" -filter_complex "[0:v]hflip[hf];[0:v]vflip[vf];[0:v]hflip,vflip[hvf];[0:v][hf]hstack[top];[vf][hvf]hstack[bottom];[top][bottom]vstack[out];[out]fps=30" -map "[out]" "4x4_%%~na.mp4"


REM this is Part C which takes the 4x4, smooths through a process of scaling and blur, time blurs, color fixes to remove black


  ffmpeg -i "4x4_%%~na.mp4" -filter_complex "[0:v]scale=iw/4:ih/4[downscaled];[downscaled]gblur=sigma=5[blurred];[blurred]eq=saturation=2:gamma=1.5[saturated];[saturated]eq=saturation=2:contrast=1[saturated2];[saturated2]scale=1920:1080,crop=1920:1080[finalscale]" -map "[finalscale]" "%%~na_vp-PC.mp4"

)
pause
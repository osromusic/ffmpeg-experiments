@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -filter_complex "[0:v]scale=iw/2:ih/2[downscaled];[downscaled]gblur=sigma=10[blurred];[blurred]split=2[blurred1][blurred2];[blurred2]setpts=PTS+1/TB[offset];[blurred1][offset]blend=all_mode=dodge[blended];[blended]scale=2*iw:2*ih[upscaled]" -map "[upscaled]" -t 5 "%%~na_smooth-dodge.mp4"
pause
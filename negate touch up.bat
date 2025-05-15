@echo off
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -filter_complex "negate[inverted];[inverted]eq=saturation=2:gamma=2:contrast=2[saturated];[saturated]hue=h=sin(t/5)*180[out]" -map "[out]" "%%~na_negate.mp4"
pause
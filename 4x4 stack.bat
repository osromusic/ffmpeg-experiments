@echo off
for %%a in ("*.mp4") do (
    ffmpeg -i "%%~na.mp4" -vf hflip -c:v libx264 "temp_fh1_%%~na.mp4"
    ffmpeg -i "%%~na.mp4" -vf hflip -c:v libx264 "temp_fh3_%%~na.mp4"

    ffmpeg -i "%%~na.mp4" -i "temp_fh1_%%~na.mp4" -filter_complex "[0:v][1:v]hstack=inputs=2" -c:v libx264 "temp_top_%%~na.mp4"
    ffmpeg -i "%%~na.mp4" -i "temp_fh3_%%~na.mp4" -filter_complex "[0:v][1:v]hstack=inputs=2" -c:v libx264 "temp_bottom_%%~na.mp4"

    ffmpeg -i "temp_top_%%~na.mp4" -c:v libx264 "temp_topv_%%~na.mp4"
    ffmpeg -i "temp_bottom_%%~na.mp4" -vf vflip -c:v libx264 "temp_bottomv_%%~na.mp4"

    ffmpeg -i "temp_topv_%%~na.mp4" -i "temp_bottomv_%%~na.mp4" -filter_complex "[0:v][1:v]vstack=inputs=2" -c:v libx264 "C:\Users\tbasso\Videos\4x4 stack\4x4 results\4x4_%%~na.mp4"

    del "temp_fh1_%%~na.mp4" "temp_fh3_%%~na.mp4" "temp_top_%%~na.mp4" "temp_bottom_%%~na.mp4" "temp_topv_%%~na.mp4" "temp_bottomv_%%~na.mp4"
)
pause
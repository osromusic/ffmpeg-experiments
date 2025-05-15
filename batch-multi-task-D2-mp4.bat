for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=and" "F:\Glitch Doc\glyj\and-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=difference" "F:\Glitch Doc\glyj\diff-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=divide" "F:\Glitch Doc\glyj\divi-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=exclusion" "F:\Glitch Doc\glyj\exclus-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=negation" "F:\Glitch Doc\glyj\nega-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=or" "F:\Glitch Doc\glyj\or-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=xor" ""F:\Glitch Doc\glyj\XOR-%%a"
pause

for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=and" "F:\Glitch Video\text\multi\and-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=difference" "F:\Glitch Video\text\multi\diff-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=divide" "F:\Glitch Video\text\multi\divi-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=exclusion" "F:\Glitch Video\text\multi\exclus-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=negation" "F:\Glitch Video\text\multi\nega-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=vividlight" "F:\Glitch Video\text\multi\Vivlit-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.300 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=xor" "F:\Glitch Video\text\multi\XOR-%%a"
pause

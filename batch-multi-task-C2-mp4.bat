for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=and" "F:\Glitch Doc\glyj\and-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=burn" "F:\Glitch Doc\glyj\burn-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=difference" "F:\Glitch Doc\glyj\diff-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=divide" "F:\Glitch Doc\glyj\divi-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=dodge" "F:\Glitch Doc\glyj\dodge-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=exclusion" "F:\Glitch Doc\glyj\exclus-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=hardlight" "F:\Glitch Doc\glyj\hardlight-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=negation" "F:\Glitch Doc\glyj\nega-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=or" "F:\Glitch Doc\glyj\or-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=pinlight" "F:\Glitch Doc\glyj\Pinlit-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=reflect" "F:\Glitch Doc\glyj\reflect-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=subtract" "F:\Glitch Doc\glyj\Subtract-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=vividlight" "F:\Glitch Doc\glyj\Vivlit-%%a"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -itsoffset 0.050 -i "%%~na.mp4" -vcodec libx264 -filter_complex "[0:v][1:v] blend=xor" ""F:\Glitch Doc\glyj\XOR-%%a"
pause

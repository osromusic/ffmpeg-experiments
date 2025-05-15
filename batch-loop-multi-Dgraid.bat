for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 1k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_01K.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 2k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_02K.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 5k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_05K.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 7k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_07K.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 9k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_09K.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 10k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_10K.mp4"
for %%a in ("*.mp4") do ffmpeg -i "%%~na.mp4" -vcodec libx264   -b:v 25k "D:\Gdoc-TxGlych\ovverly\QQ\%%~na_25K.mp4"
pause
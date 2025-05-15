@echo off
for %%a in (*.raw) do (

  REM Encode videos
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v libvpx -crf 16 -t 7 "%%~na_v4.webm"
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v mpeg4 -b:v 1M -t 7 "%%~na_mpeg4.mp4"
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v libtheora -qscale:v 5 -t 7 "%%~na_theora.ogv"
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v msmpeg4v2 -b:v 1M -t 7 "%%~na_msmpeg4v2.avi"


  REM Combine and tile
  ffmpeg -i "%%~na_v4.webm" -i "%%~na_mpeg4.mp4" -i "%%~na_theora.ogv" -i "%%~na_msmpeg4v2.avi" -filter_complex "[0:v][1:v][2:v][3:v]concat=n=4:v=1[concatenated];[concatenated]tile=2x2:margin=4:padding=4[out]" -map "[out]" "%%~na_comparison.mp4"

)
pause
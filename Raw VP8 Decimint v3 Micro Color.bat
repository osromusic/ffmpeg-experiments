@echo off
for %%a in ("*.raw") do (
  ffmpeg -f rawvideo -pix_fmt yuv420p -video_size 32x24 -r 25 -i "%%~na.raw" -c:v libvpx -qmin 1 -qmax 20 -crf 16 -t 7 "%%~na_v3.webm"
  ffmpeg -i "%%~na_v3.webm" -filter_complex "[0:v]scale=width=800:height=600,rgbashift=rh=50:gv=-50:bv=25,elbg=codebook_length=56[out_v]" -map "[out_v]" -b:v 1k "%%~na_stretch-shift_v3.webm"
  ffmpeg -i "%%~na_stretch-shift_v3.webm" -filter:v "setpts=50*PTS,minterpolate=fps=25:scd=none:mi_mode=mci:mc_mode=aobmc:me=umh:vsbmc=1:mb_size=8:search_param=400,tmix=frames=16" -c:v libvpx "%%~na_slow-microcolor_v3.webm"
  ffmpeg -i "%%~na_slow-microcolor_v3.webm" -vf "gblur=steps=4" -c:v libx264 "%%~na_RawVP8-decimint_v3-soft-micro-color.mp4"
)
pause
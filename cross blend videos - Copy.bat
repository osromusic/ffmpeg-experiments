@echo off
setlocal EnableDelayedExpansion

set "processed_files_file=processed.txt"

if not exist "%processed_files_file%" (
  echo. > "%processed_files_file%"
)

set count=0

for %%a in (*.mp4) do (
  set /a count+=1

  if!count! leq 2 (

    echo Processing: %%a

    set "file_hash=%%a"

    findstr /i "!file_hash!" "%processed_files_file%" >nul
    if!errorlevel! == 0 (
      echo %%a already processed. Skipping.
      goto:continue
    )

    for %%b in (*.mp4) do (
      if not "%%a" == "%%b" (
        ffmpeg -i "%%a" -i "%%b" -filter_complex "[0:v]setpts=PTS-STARTPTS,fade=t=in:st=0:d=5[v1];[1:v]setpts=PTS-STARTPTS,fade=t=out:st=545:d=15[v2];[v1][v2]blend=all_mode=overlay[outv];[outv]trim=end=550[v3]" -map "[v3]" -c:v libx264 "%%~na_%%~nb_blend.mp4"
        echo!file_hash! >> "%processed_files_file%"
        goto:break_inner_loop
      )
    )
  :break_inner_loop

  :continue

  ) 'Close the *entire* if block here
)

endlocal
pause
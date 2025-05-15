@echo off
setlocal

REM Find the first .mp4 video file
for %%a in (*.mp4) do (
  set "video_file=%%a"
  goto:found_video
):found_video

REM Find the first audio file
for %%b in (*.wav) do (
  set "audio_file=%%b"
  goto:found_audio
):found_audio

REM Check if both files were found
if not defined video_file (
  echo Error: Could not find a.mp4 video file.
  goto:end
)
if not defined audio_file (
  echo Error: Could not find a.wav audio file.
  goto:end
)

REM Hardcoded video duration (x minutes + x seconds = x seconds) - CHANGE IF NEEDED
set /a video_duration=400

REM Calculate fade times (integer math, less precise)
set /a audio_fade_in_duration=3
set /a audio_fade_out_duration=5
set /a video_fade_in_duration=3
set /a video_fade_out_duration=5

set /a audio_fade_out_start=%video_duration% - %audio_fade_out_duration%
set /a video_fade_out_start=%video_duration% - %video_fade_out_duration%

ffmpeg -i "%video_file%" -i "%audio_file%" -map 0:v -map 1:a -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 320k -af "afade=t=in:st=0:d=%audio_fade_in_duration%,atrim=0:%video_duration%,afade=t=out:st=%audio_fade_out_start%:d=%audio_fade_out_duration%" -vf "fade=t=in:st=0:d=%video_fade_in_duration%,fade=t=out:st=%video_fade_out_start%:d=%video_fade_out_duration%,setpts=PTS-STARTPTS" "output.mp4"

echo Video and audio combined. Output: output.mp4:end
endlocal
pause
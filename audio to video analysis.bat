@echo off
set inputFile="GATC 040725 - 02 2025-04-11 1642.wav"
set waveformOutput="waveform - %inputFile:.wav%=.mp4"
set spectrogramOutput="spectrogram - %inputFile:.wav%=.mp4"
set spectrumOutput="spectrum - %inputFile:.wav%=.mp4"

echo Creating waveform video: %waveformOutput%
ffmpeg -i %inputFile% -filter_complex "[0:a]showwavespic=s=1280x720:colors=white[v]" -map "[v]" -map 0:a -c:v libx264 -preset veryslow -crf 18 -c:a aac -b:a 192k -shortest %waveformOutput%
echo.

echo Creating spectrogram-like video (using showfreqs): %spectrogramOutput%
ffmpeg -i %inputFile% -filter_complex "[0:a]showfreqs=s=1280x720:mode=bar:freq_mode=linear:draw=line[v]" -map "[v]" -map 0:a -c:v libx264 -preset veryslow -crf 18 -c:a copy -shortest %spectrogramOutput%
echo.

echo Creating spectrum analyzer video: %spectrumOutput%
ffmpeg -i %inputFile% -filter_complex "[0:a]showspectrum=s=1280x720:mode=separate:color=white:saturation=1:intensity=1:react=0.9:decay=0.1[v]" -map "[v]" -map 0:a -c:v libx264 -preset veryslow -crf 18 -c:a aac -b:a 192k -shortest %spectrumOutput%
echo.

echo Done!
pause
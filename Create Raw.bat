@echo off
setlocal

REM --- Configuration (adjust these if needed) ---
REM set "output_folder=processed_raw"  REM Optional: If you want a separate output folder
REM mkdir "%output_folder%" 2>nul        REM Create output folder if it doesn't exist

REM --- Copy files to.raw ---
for %%a in (*) do (
  if not "%%a" == "%~nx0" ( REM Exclude the script itself
    if not exist "%%a\" ( REM Exclude folders
      echo Converting "%%a" to "%%~na.raw"...
      copy "%%a" "%%~na.raw" /b
      if!errorlevel! == 0 (
        echo Conversion of "%%a" successful.
      ) else (
        echo Error converting "%%a".
      )

    )
  )
)

endlocal
pause
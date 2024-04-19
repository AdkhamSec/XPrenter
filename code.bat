@echo off
setlocal

:: Set the paths
set IMAGE_PATH=D:\projects\Windows\Xprinter\img\code.jpeg
set OUTPUT_PATH=D:\projects\Windows\Xprinter\img\code.bmp
set PRINTER_PATH=\\.\XprinterXP-370B\
@REM set PRINTER_PATH=\\.\Xprinter XP-370B

:: Convert the image to BMP format
"C:\Program Files\ImageMagick-7.1.1-Q16-HDRI\magick.exe" convert "%IMAGE_PATH%" -monochrome "%OUTPUT_PATH%"

:: Check if the image was converted and exists
echo Sending the image to the printer...
copy /B "%OUTPUT_PATH%" "%PRINTER_PATH%"
if %ERRORLEVEL% neq 0 (
    echo Failed to send the image to the printer. Error Level: %ERRORLEVEL%
    goto end_script
) else (
    echo Image has been sent to the printer.
)

:end_script

@REM :: Check if the image was converted and exists
@REM if exist "%OUTPUT_PATH%" (
@REM     echo Sending the image to the printer...
@REM     copy /B "%OUTPUT_PATH%" "%PRINTER_PATH%"
@REM     echo Image has been sent to the printer.
@REM ) else (
@REM     echo Failed to convert the image.
@REM )

endlocal

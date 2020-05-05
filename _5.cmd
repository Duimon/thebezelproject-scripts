REM Renames the txt files to match the slangp files so we can use one name variable, 
REM searches for the bezel color values in the slangp, replacing them with the 
REM HSV values parsed from the txt files. Cleans up after.
@echo off
For %%a IN ("*.slangp") DO (
set shortname=%%~na
rename "%%~na_RGB_HSV.txt" "%%~na.txt"
call :final "%%~na.txt" "%%~na.slangp")

goto :EOF

:final
set hue=
set saturation=
set value=
for /F "usebackq tokens=1 delims=(. " %%b in ("%shortname%.txt") do set hue=%%b
for /F "usebackq tokens=3 delims=(. " %%c in ("%shortname%.txt") do set saturation=%%c
for /F "usebackq tokens=5 delims=(. " %%d in ("%shortname%.txt") do set value=%%d
_sfk.exe replace "%shortname%.slangp" "/hmbz_bezel_color_hue = \"0.000000\"/hmbz_bezel_color_hue = \"%hue%\"/" "/hmbz_bezel_color_saturation = \"0.000000\"/hmbz_bezel_color_saturation = \"%saturation%\"/" "/hmbz_bezel_color_value = \"10.000000\"/hmbz_bezel_color_value = \"%value%\"/" -yes


del "%shortname%.txt"

goto :EOF
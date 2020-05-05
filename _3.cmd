rem Parses each *RGB.txt for one of the five remaining colors, based on usage, and output just the RGB values, overwriting the original *RGB.txt
@echo off
for %%a in (*.txt) do (
set file=%%~na.txt
call :find_string
)

goto :EOF

:find_string
set FILE_TXT="%file%"
for /F "tokens=1,* delims=:" %%L in (
  'findstr /N /R ".*" %FILE_TXT%'
) do (
  if %%L equ 3 (
rem           ^ change value for the color used
rem             6 = the most common then 5, 4, 3, and 2. 2 being the least common of the 5.
    
    set "LINE_TXT=%%M"
    goto :NEXT
  )
)
:NEXT
if defined LINE_TXT set "LINE_TXT=%LINE_TXT:~13,11%"
echo.%LINE_TXT% >  "%file%"

goto :EOF
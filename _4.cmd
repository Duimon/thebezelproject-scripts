REM makes a working copy of _color.py, searches for the existing RGB value and 
REM replaces it with each value in the *RGB.txt files, runs the python script 
REM outputting HSV color values to a file of the same name appended with _HSV 
REM Cleans up by deleting the *RGB.txt files along the way.
@echo off
for %%a in (*.txt) do (
  for /F "usebackq delims=" %%D in ("%%a") do (
	set file=%%D
	set file_shortname=%%~na_HSV.txt
	del "%%~na.txt"
	call :parse_file)
)

goto :EOF

:parse_file
	copy _temp_color.py _color.py
    _GSAR.EXE -s"129, 88, 47" -r"%file%" -o "_color.py"  
    "%LOCALAPPDATA%\Programs\Python\Python35-32\python.exe" _color.py > "%file_shortname%"
	del /f /q _color.py
REM Searches for a HUE value of "0" and repaces it with "0.0" just to make parsing easier	
	_gsar.exe -s"(0," -r"(0.0," -o "%file_shortname%" "%file_shortname%"
goto :EOF
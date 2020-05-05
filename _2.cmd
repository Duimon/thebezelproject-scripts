@echo off
rem Rename the slangp so it is safe in case anything goes wrong.
ren "_Beetle PSX HW.slangp" "_Beetle PSX HW.slangpOLD"
rem convert every png, one at a time to a flat 5 color image and crop to the first 224 pixels on the left side
for %%e in (*.png) do (
_convert.exe "%%~ne.png" -flatten -crop 224x1080+0x0 +dither -colors 5 temp.png
set file=%%~ne_RG
rem Generate an image histogram, sort it alphabetically, output to a text file the same name as each png appended with RGB, and clean up after.
_convert.exe  "temp.png"  -format %%c histogram:info:hist.txt
sort hist.txt /o "%%~ne_RGB.txt"
del hist.txt
del temp.png
)

del temp_RGB.txt



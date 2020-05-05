rem Search for "placeholder" in the .slangp, replace it with the filename of each png and output a .slangp of the same filename.
@echo off
for %%a in (*.png) do (
_GSAR.EXE -h -s"placeholder" -r"%%~na"	"_Beetle PSX HW.slangp" -f "%%~na.slangp"
) 

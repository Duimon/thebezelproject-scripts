# thebezelproject-scripts
Scripts to create shader presets for the HSM Mega Bezel Reflection Shader using thebezelproject graphics

## Prerequisites

This project makes use of some 3rd party utilities.
* “convert.exe” from [ImageMagick](https://imagemagick.org/index.php)
* “sfk.exe” [(Swiss File Knife)](https://sourceforge.net/projects/swissfileknife/)
and
* “gsar.exe” [(general search and replace utility)](http://gnuwin32.sourceforge.net/packages/gsar.htm)

It also assumes you are using a version of Windows that has **"sort.exe"** in the system32 folder, and that you have Python istalled at **"%LOCALAPPDATA%\Programs\Python\Python35-32\python.exe"** If you have to install Python and/or it has a different path, you will need to edit the script **"_4.cmd"** to reflect your path.

###### Instructions

There is quite a bit of setup required to use these scripts, but after doing it once it gets easy😉. I will assume you have a working retroarch setup and are successfully using the HSM Shader. Thebezelproject requires a standard “no-intro” named romset.

**1.** Create a temporary installation of Retroarch by copying your existing “working” retroarch folder to a temporary location. (We will never actually run retroarch from the temporary installation) Thebezelproject Windows installer will overwrite some key files and break your Retroarch configuration. For these instructions we will assume a temporary installation of **“Retroarch-thebezelproject”**.

**2.** Download [thebezelproject Windows installer.]( https://github.com/thebezelproject/BezelProject-Windows)

**3.** Follow the installer instructions and download at least one set of retroarch overlays. (If you are planning on doing more than one system then you may as well download them all now.)

**4.** For ease of use I recommend creating an “images” directory within the Retroarch root directory, and subdirectories for each system. For these instructions we will assume a folder structure of…

Retroarch\images\PSX\

**5.** Copy the downloaded images from **“Retroarch-thebezelproject\Overlays\GameBezels\PSX\”** to your prepared images folder at **”Retroarch\images\PSX\”**. You will notice that thebezelproject downloader also downloaded default overlays at **“Retroarch-thebezelproject\Overlays\”**. Copy the **“Sony-PlayStation.png”** to your PSX folder and rename it to **“placeholder.png”**. Repeat this for every system you plan on converting.

**6.** Run retroarch and install your chosen Playstation core. These instructions will assume **”Beetle PSX HW”**. Load the core and some content. Load your chosen HSM shader. Adjust at least one shader parameter. Since the scripts and instructions require it, I recommend you go ahead and make these adjustments now:

* [SCALING] Integer Scale Mode - 0:Off, 1-ShortAxis, 2-BothAxes  = 0.00

_(Not required by the scripts. If you choose a different value then in step **"8."** you will need to adjust the **"[SCALING] Int Scale Border Min Height %"** instead of the Non-Integer)_
* [BG IMAGE] Scale Mode – 0:Auto 1:Fullscreen 2:Fit Height	= 1.00

_(Also not required by the scripts but just makes sense if you are using thebezelproject graphics)_
* [BEZEL & FRAME COLOR] Color Hue 				= 0.00
* [BEZEL & FRAME COLOR] Color Saturation			= 0.00
* [BEZEL & FRAME COLOR] Color Value (Brightness		= 10.00

_(Should be the default values but make sure they are set this way, the last script will fail otherwise)_

Save a core preset.

**7.** Edit the core preset at **” RetroArch\shaders\presets\Beetle PSX HW\Beetle PSX HW.slangp”**

Change the line 

BackgroundImage = "../../shaders_slang/crt/shaders/hyperspacemadness/textures/BackgroundImage_3840x2160.png"

to

BackgroundImage = "../../../images/PSX/placeholder.png"

**8.** Run retroarch and adjust the shader parameters to your liking, making sure to use the **[SCALING] Non-Integer Scale %** parameter  to cover the bezel in the existing graphic. Save a core preset.

**9.** Copy the scripts from my repo to your PSX images folder. Replace the **”_Beetle PSX HW.slangp”** with your preset. (Copy your preset to the folder instead of moving it, it will be used as a default in case thebezelproject doesn’t have a graphic for one or more of your ROMs. Make sure it is named **”_Beetle PSX HW.slangp”**) (Use this slangp name when repeating this process for all your systems at this point, it will keep you from needing to edit any scripts)

**10.** Execute the 1st script **”_1.cmd”**.

The rest of the scripts just generate different colored bezels based on the color palette of each thebezelproject graphic. If you choose to execute the rest of the scripts, keep in mind that some are doing quite a bit of work, and can take some time, especially for large numbers of graphics like the PSX set. Be patient and don’t forget what script you are running. Run them in order 1 - 5.

When you are finished with the scripts (Either after the first script or all 5 of them), just move all of the generated **“*.slangp”** to your **”Beetle PSX HW”** preset folder and you are done.

You can delete the extra files (leaving only your *.PNGs) and repeat the process for all of your systems.

The comments in the **”_3.cmd”** script explain how to choose which color you use for the creation of the presets. By default, it uses the second to the least used color in the palette. You can play with this if you’re fussy 😊.

## Script Explanation
What these scripts do is search for a line of code in your preset and replace it with the name of each *.png, and output a *.slangp file with the same name as the *.png. Then each image is converted to a temporary image that is cropped, flattened, and dithered to 5 colors. Next, they produce an image histogram that lists each color in order from least used to most used. The RGB value of the second to least used color is extracted and converted to an HSV value. This HSV value is then used to edit each *.slangp so the bezel has the corresponding HSV value. 

# thebezelproject-scripts
Scripts to create shader presets for the HSM Mega Bezel Reflection Shader using thebezelproject graphics

## Instructions

This project makes use of some 3rd party utilities.
* “convert.exe” from [ImageMagick](https://imagemagick.org/index.php)
* “sfk.exe” [(Swiss File Knife)](https://sourceforge.net/projects/swissfileknife/)
and
* “gsar.exe” [(general search and replace utility)](http://gnuwin32.sourceforge.net/packages/gsar.htm)

There is quite a bit of setup required to use these scripts. I will assume you have a working retroarch setup and are successfully using the HSM Shader.

**1.** Create a temporary installation of Retroarch by copying your existing “working” retroarch folder to a temporary location. Thebezelproject Windows installer will overwrite some key files and break your Retroarch configuration. For these instructions we will assume a temporary installation of **“Retroarch-thebezelproject”**.

**2.** Download [thebezelproject Windows installer.]( https://github.com/thebezelproject/BezelProject-Windows)

**3.** Follow the installer instructions and download at least one set of retroarch bezels. (If you are planning on 

**4.** For ease of use I recommend creating an “images” directory within the Retroarch root directory, and subdirectories for each system. For these instructions we will assume a folder structure of…

Retroarch\images\PSX\

**5.** Copy the downloaded images from **“ Retroarch-thebezelproject\Overlays\GameBezels\PSX\”** to your prepared images folder at **”Retroarch\images\PSX\”**. You will notice that thebezelproject downloader also downloaded default overlays at **“Retroarch-thebezelproject\Overlays\GameBezels\”**. Copy the **“Sony-PlayStation.png”** to your PSX folder and rename it to **“placeholder.png”**. Repeat this for every system you plan on converting.

**6.** Run retroarch and install your chosen Playstation core. These instructions will assume **”Beetle PSX HW”**. Load the core and some content. Load your chosen HSM shader. Adjust at least one shader parameter. Since the scripts require it, I recommend you go ahead and make these adjustments now:

* [BG IMAGE] Scale Mode – 0:Auto 1:Fullscreen 2:Fit Height	= 1.00
* [BEZEL & FRAME COLOR] Color Hue 				= 0.00
* [BEZEL & FRAME COLOR] Color Saturation			= 0.00
* [BEZEL & FRAME COLOR] Color Value (Brightness		= 10.00

Save a core preset.

**7.** Edit the core preset at **” RetroArch\shaders\presets\Beetle PSX HW\Beetle PSX HW.slangp”**

Change the line 

BackgroundImage = "../../shaders_slang/crt/shaders/hyperspacemadness/textures/BackgroundImage_3840x2160.png"

to

BackgroundImage = "../../../images/PSX/placeholder.png"

**8.** Run retroarch with your content and adjust the shader parameters to your liking, making sure to use the **[SCALING} Non-Integer Scale %** parameter  to cover the bezel in the existing graphic. Save a core preset.

**9.** Copy the scripts from my repo to your PSX images folder. Replace the **”_Beetle PSX HW.slangp”** with your preset. (Copy your preset to the folder instead of moving it, it will be used as a default in case thebezelproject doesn’t have a graphic for one or more of your ROMs. Make sure it is named **”_Beetle PSX HW.slangp”**) (Use this slangp name when repeating this process for all your systems at this point, it will keep you from needing to edit any scripts)

**10.** Execute the 1st script **1.cmd”**.

At this point you can move all of the generated **“*.slangp”** to your **”Beetle PSX HW”** preset folder and you are done. The rest of the scripts just generate different colored bezels based in the color pallet of each thebezelproject graphics. If you choose to execute the rest of the scripts, keep in mind that some are doing quite a bit of work, and can take some time, especially for large numbers of graphics like the PSX set. Be patient and don’t forget what script you are running. Run them in order 1 - 5.

When you are done. Just move the newly created

The comments in the **”3.cmd”** script explain how to choose which color you use for the creation of the presets. By default, it uses the second to the least used color in the pallet. You can play with this if you’re fussy 😊.

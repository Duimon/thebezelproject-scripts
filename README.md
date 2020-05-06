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

**5.** Copy the downloaded images from **“ Retroarch-thebezelproject \Overlays\GameBezels\PSX\”** to your prepared images folder at **”Retroarch\images\PSX\”**. You will notice that thebezelproject downloader also downloaded default overlays at **“Retroarch-thebezelproject\Overlays\GameBezels\”**. Copy the **“Sony-PlayStation.png”** to your PSX folder and rename it to **“placeholder.png”**. Repeat this for every system you plan on converting.

**6.** Run retroarch and install your chosen Playstation core. These instructions will assume **”Beetle PSX HW”**. Load the core and some content. Load your chosen HSM shader

Hello! I am Paul Racey and I have created my first star citizen program: StarScreenShots!

Initially created by: bearFather

- BASIC BACKGROUND -
  
This program allows you to change the default splash screen when first loading the game into whatever you so wish it to be!
In this folder you will see the following:
  1. An "ExtraLinks" folder, this is important to running the code itself
  2. A "SplashScreens" folder, this is what holds the actual images you will be using. The splash screen folder will hold subfolders that you use to add images, be sure to check the dimensions section to see what you need to add for the images.

The main program is the 'randomscspalsh.ps1' file, this file holds everything the code needs to run, including the shortcut creator, RSI folder finder, image replacer, and relative paths to the folder itself.
An 'RSI Launcher (BETA).ico' file is also located in 'ExtraLinks', this file just adds the image to the desktop shortcut.

As stated above, the splash screen folder holds a default subfolder called 'Default Screen Shots', folders like these in the splash screen folder are how the program reads images to add to the pool. You MUST make one to use the images you want to.


 
 - INSTALLATION -

   There is a README.txt attached to the program itself, but here is the method to install the program into your computer:

   1. Place the 'StarScreenShots' folder into any location that does not require admin access. This program is not yet given administrative permissions and so can not write in folders like 'Program files'.
   2. In 'ExtraLinks' run the randomscspalsh.ps1 with PowerShell (right-click and the option should be at the top)
   3. Let the program run, it will take some time on your first time so be sure to let it sit and find the RSI folder.
   4. The program will eventually close, and your RSI Launcher will open. You will also see a 'RSI Launcher (BETA)' program on your desktop.
  
      As long as you run the 'RSI Launcher (BETA)' program, you will now get a new splash screen whenever your RSI Launcher loads.

      

 - FOR CREATORS: DIMENSIONS -
   
   A creator template is available as a hidden file within the StarScreenShots folder, another README.txt is in that folder.

   Dimensions for splash screens are;
   800 wide
   450 tall

   ONLY .png files can be used, the program will not run if you have a .jpg or any other file as the extension.
   A star citizen logo is available to put over any screenshot you'd like, be aware that EasyAntiCheat adds a bar over the bottom area of the screen, so offset the logo upwards slightly.

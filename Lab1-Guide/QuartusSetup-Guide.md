# Quartus Setup Guide

## Downloading the Quartus Installer

The Quartus V17.0 Lite Installer files for both Linux and Windows are available from the class Google Drive.

Download the files listed for your OS:

* **For Windows[7 & 10]**: [Quartus V17.0 Lite Windows](https://drive.google.com/drive/folders/0B3gj26Jx7aigWnRZSU1ubllXQUE )
  * QuartusLiteSetup-17.0.0.595-windows.exe
  * ModelSimSetup-17.0.0.595-windows.exe
  * cyclonev-17.0.0.595.qdz

* **For Linux**: [Quartus V17.0 Lite Linux](https://drive.google.com/drive/folders/0B3gj26Jx7aigX2ZFSnB6c1FGY0U)
  * QuartusLiteSetup-17.0.0.595-linux.run     
  * ModelSimSetup-17.0.0.595-linux.run
  * cyclonev-17.0.0.595.qdz

## Install Process

### For Windows: 

Run: **QuartusLiteSetup-17.0.0.595-windows.exe**
  * Have all 3 files in the same download directory - when you run the QuartusLiteSetup-17.0.0.595-windows.exe program, it will install the Modelsim and Cyclone V support (be sure to select the Cyclone V support in the install process)

### For Linux (Ubuntu 16.04LTS): 

From a command shell [run as root] install the program in the /opt directory:
* Be sure the x bit is set for the file permissions  --->  `sudo chmod +x QuartusLiteSetup-17.0.0.595-windows.exe`
* Then install it ---> `sudo ./QuartusLiteSetup-17.0.0.595-windows.exe`

After the Quartus install completes, there are additional packages that need to be installed for ModelSim to provide 32-bit runtime support for the USB programmer.

Run these install commands:

```
$ sudo dpkg --add-architecture i386
$ sudo apt-get update
$ sudo apt-get install libc6:i386 libstdc++6:i386 libncurses5:i386 libxft2:i386 libxext6:i386
```

There is also a bug work around that needs to be done for ModelSim:

1. Select **Tools** -> **Options...** from the menu bar
2. Click **EDA Tool Options** on the left hand panel
3. Copy the path from the **ModelSim-Altera** box to the **ModelSim** box --> ** /opt/intelFPGA_lite/17.0/modelsim_ase/linuxaloem **
4. Click **OK** to save the changes

## License Server

Connect to the CWRU license server to register Quartus:

1. From the Quartus menu, select **Tools** -> **License Setup...**

1. In the **License File** box enter: _1800@cse-lic-03_

1. The set of licensed cores should update [4 total].




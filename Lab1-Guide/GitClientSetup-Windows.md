# Git Client Setup for Windows

:information_source: **Note:** All of the Git clients presented should work on either Windows 7 or Windows 10.  This document will mainly focus on Windows 7 since the lab machines in the Glennan Design Lab are running the Windows 7 Enterprise Edition.

## Git Client Options

There are a number Git client options available for Windows:

* [Git for Windows (GitGUI / GitBash)](https://git-for-windows.github.io)
* [GitHub Desktop](https://desktop.github.com)
* [GitKraken](https://www.gitkraken.com)
* [SourceTree](https://www.atlassian.com/software/sourcetree)
* [TortoiseGit](https://tortoisegit.org)

Any of these clients may be used for the class but the **recommended** options will be either **Git for Windows** or **GitHub Desktop**.  These clients provide both a graphical user interface (GUI) and command line tools.  While the GUI is convenient for basic functions, the command line tools provide full Git functionality which is necessary for many advanced Git features.

## Git for Windows (GitGUI / GitBash)

GitGUI and GitBash are installed on the Glennan Design Lab machines.  As such, the documentation for the class will present examples using these apps but the same basic git concepts would apply to the other applications.

### Installation

1. Download the **Git for Windows** installer from the website: [Download](https://git-for-windows.github.io/index.html)

2. Run the installer.  

	**NOTE:** There are a lot of installer options to click through.  The default options should be fine for most setups but you may want to read through carefully if you have specific requirements.

	**Recommended:** To place icons on the Desktop for quick access, select the **Additional Icons** -> **On the Desktop** from the **Select Components** dialog.
	
3. Three main applications will be installed: **Git GUI**, **Git Bash** and **Git CMD**.
	
	* **Git GUI** provides a graphical user interface for managing git repositories.

	* **Git Bash** provides a command-line interface using the bash shell with additional utilities for advanced scripting.  Most linux git examples will work using this interface.

	* **Git CMD** provides the git command-line utilities using the Windows command-line interface.


## GitHub Desktop

**GitHub Desktop** is available for both Windows and Mac if cross-platform support is desired.  Like **Git for Windows**, both a GUI and command-line tools are provided.

Follow this guide for setting up **GitHub Desktop**: 
[Getting Started with GitHub Desktop](https://help.github.com/desktop/guides/getting-started/)

**Note:** On Windows, there are two applications installed.  The **GitHub Desktop** GUI application and the **Git Shell** command-line interface.  The command-line interface **Git Shell** is probably the easier of the two options to use for your normal workflow.  When setting up SSH key access you'll want to use **Git Shell**.

## nano Editor Installation

If you are setting up your own Windows development machine, the following instructions will setup **nano** to run in the **Git Bash** shell.

:warning: **NOTE:** The lab machines in the Glennan Design Lab have already been installed with **nano** so you only have to set the editor using the command in the previous section.

Installation:

1. Open the following URL in a web browser: [https://www.nano-editor.org/dist/win32-support/](https://www.nano-editor.org/dist/win32-support/)

2. From the file list, download the file named similar to `nano-git-0d9a7347243.exe` (the build revision may differ).
	
3. Copy the downloaded file to the `C:\Program Files\Git\cmd` directory.

	**NOTE:** Administrator access is needed to copy the file.

4. In order to launch the application cleanly, create a bash script in your user home directory named `nano` with the following commands:

	```
	#!/bin/sh	winpty nano-git-0d9a7347243.exe "$@"
	```
	
	:warning: Make sure to modify the file name to match the downloaded file.
	
	:warning: **WARNING:** If using Notepad or another Windows editor, make sure a `.txt` or other extension is not appened to the file name.
	
5. Copy the `nano` bash script to the `C:\Program Files\Git\cmd` directory.

	**NOTE:** Administrator access is needed to copy the file.

6. From the GitBash command line, you should now be able to run the **nano** editor with the command `nano`.

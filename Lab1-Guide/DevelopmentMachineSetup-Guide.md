# Development Machine Setup Guide

For this class, you have the option of using the lab computers in the Glennan Undergraduate Design Lab (Glennan 312) or using your own machine.  The machines in the Glennan lab are running Windows 7 Enterprise Edition and have all the necessary software installed.  If you wish to setup your own machine, this guide will list all the required software and provide some installation guidance.

## Required Software

The following software has been installed on the lab machines in the Glennan Design Lab.

* Intel® Quartus® Prime v17.0 Design Software (with ModelSim-Altera)
* TeraTerm Pro v4.95
* Git for Windows (Git GUI / Git BASH) (or equivalent)
* Notepad++ (with MarkdownViewer++)

### FPGA Design

The Quartus software is required for the FPGA development work and is the only option available.  

Quartus is available for Windows 7/10 and Linux (64-bit RedHat or Debian distros), although the Windows 10 and Linux versions have some usage issues.

If you are running a macOS system, Quartus can be run on Windows in a virtual machine (such as Parallels).

If you are running Linux, you may have problem with ModelSim and the 32-bit device drivers to load the hardware designs on the development boards.

### Serial Terminal

Some of the labs will use a serial UART for communication.

[TeraTerm Pro](https://ttssh2.osdn.jp/index.html.en) is installed on the lab machines for this use.  This is a Windows-only program but works well.

Other Windows options would include [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/).

On Linux, [minicom](https://help.ubuntu.com/community/Minicom) is available.

On macOS, the built-in [screen](https://pbxbook.com/other/mac-tty.html) command can be used from the Terminal.

### Git Client

[**Git for Windows**](http://gitforwindows.org) is installed on the lab machines and provides **Git GUI** and **Git Bash**.  Most of the lab documentation presents examples using the `git` application from **Git Bash**.

Another Windows alternative is [**GitHub Desktop**](https://desktop.github.com) which provides both the **GitHub Desktop** graphical interface (similar to **Git GUI**) and **Git Shell** (similar to **Git Bash**).

Most Linux distros have a **git** install package which provides the `git` command-line application.  For the most part, the **Git Bash** examples using the `git` command will work the same on Linux.  There are a few minor differences between implementations but should not affect our usage.

For macOS, **GitHub Desktop** is also available.  There's also a `git` command available from Terminal if you have Xcode installed.  The `git` command is mostly compatible with the Linux version (although some command options do differ).

### Markdown Editor

The lab machines have [**Notepad++**](https://notepad-plus-plus.org) with the MarkdownViewer++ plugin installed.  While Notepad++ is a great text editor, the preferred option would have been [Atom](https://atom.io) with the Markdown plugins. Unfortunately, Atom will not install cleanly with the lab machines Windows Domain setup.

A workaround is required for Notepad++ to render images in Markdown documents which is detailed in the [**MarkdownViewer++ Workaround**](Lab2-Guide/NPP-PDF-Workaround.md) document.

[**Atom**](https://atom.io) is available for Windows, Linux and macOS.  It has a lot of features including Markdown editing with live preview.

For macOS, [**MacDown**](https://macdown.uranusjr.com) is a dedicated Markdown editor which works well.  One missing feature is converting emoji tags in the preview pane but image rendering and PDF exporting works fine.

The main feature missing from a lot of editors is the ability to accurately render [GFM](https://github.github.com/gfm/) (GitHub Formatted Markdown).  Currently, out of the editors that can convert Markdown to PDF, Atom has the best support for GFM.

## Setting Up Your Development Machine

The following section will provide some help if you are setting up your own machine.

:warning: **WARNING:** The lab computers in Glennan 312 are already setup so you don't need to do any of this for those machines.

### Software Mirror

All of the required software packages have been mirrored on a Google Drive directory which the class should have access to.  If you need the link, ask the instructor.

### Operating System Issues

Ideally all development tools would be operating system agnostic but unfortunately that's not the case yet for some of the tools needed for this class.

The Intel Quartus Prime design software can run on either Windows (7/10) or Linux (64-bit).  

* The Windows 7 support is the most solid.  If you want least amount of trouble with the labs Windows 7 is recommended. The machines in the Design Lab are running Windows 7 Enterprise Edition.

* Windows 10 has a few minor issues that can be worked around without too much effort.

* The Linux installation process has a number of issues due to the need for the 32-bit driver support.  If you are installing on Linux talk to the instructor for help.  There are also few issues running the ModelSim simulations.

### Quartus Installation

Follow this guide to setup Quartus: [Quartus Setup Guide](QuartusSetup-Guide.md)




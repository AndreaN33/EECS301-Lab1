# Lab #1 Assignment

## Objective

This lab focuses on setting up the required development tool chains, accessing the classwork source control system, learning the Markdown markup language used for lab documentation, and finally using the Quartus/ModelSim FPGA design and simulation software to load a design project on the hardware.  The lab includes a walkthrough of commonly seen syntax bugs and the related compiler error messages but no actual design work yet.

For those unfamiliar with the tools, the lab may be challenging but the lab guides try to walk though each required step for setting up the design environment.  The class TAs and the Slack discussion board should provide help when needed so be sure to ask.

For those familiar with Quartus and GitHub, this lab should be simple but still try to read completely through the guides incase there are any finer points you may not be aware of.

:information_source: The lab guides provide (or link to) all the information needed to complete the assignments.  As such, some of the documents include **a lot** of information.  Try to carefully read through the guides to prevent simple mistakes.  Typos have been one of the most common problems encountered in previous semesters.  For example, some signal names in the guides are used elsewhere in the framework so need to match **exactly** as shown (including case) to be connected properly.  Consider copy-and-pasting names and code snippets from the guides to avoid typos.

## Assignment Overview

:information_source: This section in each guide provides a quick overview list of the assignment tasks described in the [**Assignment Details**](#assignment-details) section.

* Join the **EECS301 GitHub** Organization
* Join the **EECS301 Slack** Team
* [**Git/GitHub** Tutorial](Lab1-Guide/StartingGithub-Guide.md)
* [**Markdown** Tutorial](Lab1-Guide/Markdown-Guide.md)
* _(optional)_ [Development software installation](Lab1-Guide/DevelopmentMachineSetup-Guide.md) for personal computer
* [**Quartus Prime** Design Software Tutorial](Lab1-Guide/QuartusProject-Guide.md)
* [**Frustration Lab** Tutorial](Lab1-Guide/FrustrationLab-Guide.md)
* [**ModelSim** Tutorial](Lab1-Guide/ModelSimOverview-Guide.md)
* Lab Report write-up
* Commit, push and submission tag all modified lab files to **GitHub**
* Submit report to **Canvas**

## Assignment Details

1. Join the [**EECS301 GitHub Organization**](https://github.com/CWRU-EECS301-S18)

	:warning: This step should have already been completed if you're reading this document.  If you **do not** have a **GitHub** account yet, follow this guide: [**GitHub Account Setup**](https://github.com/CWRU-EECS301-S18/syllabus/blob/master/GitHubAccountSetup-Guide.md)
	
	Make sure to send your **GitHub** username to the instructor to be added to the [**EECS301 GitHub Student Team**](https://github.com/orgs/CWRU-EECS301-S18/teams/student-team).

1. Join the [**EECS301 Slack Team**](https://cwru-eecs301-s18.slack.com): 

	:information_source: **Slack** will be used as the main class communication channel (outside the classroom / lab) for assignment questions and collaboration between students.
	
	* A sign-up invite email will have been sent to the class before the first lecture.  Follow the provided invite link to join the class **Slack Team**.
	* If new to **Slack**, review the [New User Tutorial](https://get.slack.help/hc/en-us/articles/218080037-Getting-started-for-new-users).
	* Check the [***lab1-discussion***](https://cwru-eecs301-s18.slack.com/messages/C8QSS3G07/) channel for assignment updates or to ask questions about the assignment.

1. Follow this guide to learn the Git and GitHub basics: [**Starting Guide to GitHub**](Lab1-Guide/StartingGithub-Guide.md)

1. Assignment documentation and lab reports will use the [**Markdown**](https://en.wikipedia.org/wiki/Markdown) markup language.  Follow the [**Markdown Guide**](Lab1-Guide/Markdown-Guide.md) to learn how to write Markdown.

1. The lab computers in the **Glennan Undergraduate Design Lab** (Glennan 312) are setup and available for all lab work or, **optionally**, you can setup your own development machine using the following guide: [**Development Machine Setup Guide**](Lab1-Guide/DevelopmentMachineSetup-Guide.md)

	For whichever system you choose to use, capture an image of the **Quartus License Setup** screen following these steps:
	
	1. Start Quartus.
	1. From the menu bar, select **Tools** -> **License Setup..."** to open the License Setup window.
	1. The CWRU License should show 4 license modules (if not report the problem to a TA).
	1. Capture the window image using one of the methods listed in the [Screen Capture Guide](Lab1-Guide/ScreenCapture-HowTo.md).
	1. Include the captured image in the Lab Report using the Markdown image tag shown in the [Markdown Guide](Markdown-Guide.md#markdown-images).
	
1. The [**Quartus Project Guide**](Lab1-Guide/QuartusProject-Guide.md) introduces the [Intel® Quartus® Prime Design Software](https://www.altera.com/products/design-software/fpga-design/quartus-prime/overview.html) used for FPGA development and walks-through building and loading an FPGA image on the [TerasIC DE1-SoC Development Board](https://github.com/CWRU-EECS301-S18/syllabus/tree/master/Reference/DE1-SoC).

1. The [**Frustration Lab Guide**](Lab1-Guide/FrustrationLab-Guide.md) demonstrates common coding errors typically encountered when compiling projects with Quartus.

1. The [**ModelSim Overview Guide**](Lab1-Guide/ModelSimOverview-Guide.md) provides an overview of the ModelSim simulator and demonstrates the test bench debugging process for FPGA designs.

1. Each lab will require a Lab Report detailing your project work and what was learned.  Write the lab report following the [**Lab Report Requirements Guide**](#lab-report-requirements).

1. Submit the assignment (including all code, project files, and lab report) back to GitHub following the [**Lab Assignment Submission Guide**](Lab1-Guide/GitHub-SubmissionGuide.md).

1. Submit the lab report in PDF format to Canvas.

	**NOTE:** See the [MarkdownViewer++ Workaround](Lab2-Guide/NPP-PDF-Workaround.md) document if using NotePad++ to create the PDFs. 

## Lab Report Requirements

Lab reports will be written using the Markdown markup language and stored in your lab assignment GitHub repository.  The goal of the report is to provide the sort of work documentation which will be expected once in industry.  The [**Lab Report Expectations Guide**](Lab1-Guide/LabReportExpectations.md) has details and helpful guidelines for writing the lab reports.

A directory (**Lab1-Report**) and a starting template file (**README.md**) are provided for the report.  Use the [Lab1-Report/README.md](Lab1-Report/README.md) file as the staring point for your lab report.  This will be the top level file for the lab report.  Any other files (such as images or additional documents) may be added to the Lab Report directory but should be referenced (using Markdown hyperlinks) through the top level **README.md** file.  

:warning: The Grader will look at the **README.md** file to grade your lab.  If they cannot find the report then they will assume it wasn't turned in so make sure to use the template file provided and be sure that all changes have been _commited_ and _pushed_ before applying the **submission** tag to the lab repository (as detailed in the [**GitHub Submission Guide**](Lab1-Guide/GitHub-SubmissionGuide.md)).

:information_source: On **GitHub**, a directory's **README.md** file will automatically be shown when browsing the directory tree.  For that reason, it's convenient to have the README.md file as the top level file for the reports.

A PDF version of the report must also be submitted to **Canvas**.  Most Markdown editors can export or print PDFs directly (although some editors have rendering issues).  If using the MarkdownViewer++ plugin for Notepad++, then this document [MarkdownViewer++ Workaround](Lab2-Guide/NPP-PDF-Workaround.md) has the instructions needed to create PDFs with images properly rendered. 


## GitHub Usage

We'll be using **GitHub Classroom** to deploy assignments.  Please report any issues encountered using GitHub either via Slack or directly to the instructor team via e-mail.

**GitHub Classroom** will automatically create a new Git repository for each lab assignment via an invite email.  All you have to do is click the invitation link in the invite email and your assignment repository will be created.  All repositories are Private so only you and the instructor team have access.

:warning: Please only use the repositories on the EECS301 GitHub account for EECS301 related class work.

## Lab Due Date

The lab report submission will be due by 3:00pm on 09/01/2017.

All files and code should be submitted to GitHub following the [Submission Guidelines](Lab1-Guide/GitHub-SubmissionGuide.md) by the submission deadline.

## Grading Rubric

* Submitting Name / Email / GitHub username - 10 pts
* Submitting Report in Markdown format - 10 pts
* License Setup window image included in the report showing installed licensed modules (4 total) - 40 pts
* Running Demo code in Quartus and screen shots of results - 40 pts

## Reference Material

:information_source: Links to additional reference material that may be helpful but not required for the lab.

* [Intel Quartus Prime Support Home](https://www.altera.com/products/design-software/fpga-design/quartus-prime/support.html)
* [GitHub Guides](https://guides.github.com)
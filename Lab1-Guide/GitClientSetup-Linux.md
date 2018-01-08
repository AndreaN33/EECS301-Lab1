# Git Client Setup for Linux

All the major linux distributions have a command-line **git** package that can be easily installed.

For Debian-based distros (e.g. Ubuntu):

```shell
$ sudo apt-get install git-all
```

After installing **git**, there are a number of configuration steps that need to be run only once:

1. Set your username and email address

	```shell
	$ git config --global user.name "YOUR NAME"
	$ git config --global user.email "YOUR EMAIL ADDRESS"
	```

1. Select the default push behavior

	```shell
	$ git config --global push.default simple
	```

1. Set your editor for commit comments

	```shell
	$ git config --global core.editor "nano"
	```

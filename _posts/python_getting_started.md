---
title: Python: Virtual Environments on Windows - Getting Started
date: 2023-02-09 18:00:00 +0200
categories: [Python, Guide]
tags: [python, windows, guide]     # TAG names should always be lowercase
description: Beginner's introduction to Python virtual environments
toc: false
comments: false
---

This short guide provides an introduction for beginners using native Python on a Windows machine. By following these steps, you will be ready to start your coding project from a fresh installation.

**Prerequisites:** Python is installed on your machine (with default settings)


## 1. Create a virtual environment
A virtual environment in Python is an isolated workspace that allows you to install and manage dependencies separately from the system-wide Python installation. It helps avoid conflicts between different projects that require different package versions. Therefore, at least one separate virtual environment should be created for each project. In addition, it may be useful to create test environments alongside the main environment to avoid compromising the working configuration in the production environment.


Open the command line interpreter by typing `cmd` in the Windows search field. First, type `where python` and hit enter to check if Python is installed. The output should look like this:

```cmd
> where python
> C:\Program Files\Python310\python.exe
```

To create a new environment, first navigate to the directory where you want to create the environment (e.g., your project directory) using `cd` and then execute the `venv` module and specify the name for your environment. I use `.venv` below to install the environment in `C:\path\to\my\project\.venv`, but you could use any name for the folder.

```
> cd C:\path\to\my\project
> python -m venv .venv
```
Python will now create a virtual Python installation in the `.venv` folder. It will include only a few basic packages but you can install additional packages later.

To remove a virtual environment, simply delete the `.venv` folder.

## 2. Activate a virtual environment
Before you can install or use packages in your virtual environment you need to activate it by executing the activation script located in the new environment. Run:

```
> .venv\Scripts\activate.bat
```
Once activated, `(.venv)` appears in the command prompt, indicating that commands will now use the virtual environment.

To deactivate your environment, simply run `deactivate`.

## 3. Install packages to a virtual environment
To install packages, activate your virtual environment and use the package manager pip to install, uninstall, and manage packages:

```
> pip install <package_name>                # Install a package
> pip install <package_name> --upgrade      # Update a package
> pip install --upgrade pip                 # Update pip itself
> pip list                                  # List installed packages
> pip uninstall <package_name>              # Uninstall a package
```


## Some other useful commands
You can execute the following command in a new command prompt or in a command prompt after activating a virtual environment. Without activation, it will display the version of the system-wide Python installation (or the one in the PATH). With activation, it will display the Python version inside the virtual environment.

```
> python --version      # Displays the Python version currently in use
> where python          # Shows the path to the active Python interpreter
> py --version          # Explicitly check the system-wide Python version
```




## Notes and Tips:
- You should exclude your virtual environment directory from your version control system using .gitignore or similar.
- You should not save any of your own code inside the environment folder (e.g., `.venv`)
- Instead of `.venv`, it might make sense to name the environment according to the used python version (e.g., `py310`) or according to the project it is used for (e.g., `my_project`)
- If you are using an IDE to work on your project (e.g., Spyder, PyCharm) you must tell the IDE to use your virtual environment's python install as the interpreter. Most IDEs allow selecting a Python interpreter. Set it to `C:\path\to\my\project\.venv\Scripts\python.exe`. Check your IDE documentation for specific steps
- `pip freeze` allows you to save the current state of your environment. It generates a list of all installed Python packages in the current environment along with their exact versions. Use `pip freeze > requirements.txt` to generate the file indicating the dependencies. If you want to reinstall the same dependencies in another environment, execute `pip install -r C:\path\to\my\requirements.txt` in your other environment.


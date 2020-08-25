# CD2

A shell script to help navigate to commonly navigated items

## Installation

1. Change Execution mode
   > chmod +x cd2.sh
2. Run install function
   > sudo ./cd2.sh install

## Use

* > cd2 GitProject
   * This will navigate you to a directory you defined

## Adding a path

1. Open the cd2.sh file in your favorite text editor
   * At path `/opt/bin/cd2.sh`
2. Add a key:value pair to the shell script
   > directories["name"]="/path/to/directory"
3. Save the shell file

## TODO

* Figure out how to change directory in current bash window
  * alias or spawn new terminal window
* Possibly redo codebase to not be a shell script
  * c?
  * golang?
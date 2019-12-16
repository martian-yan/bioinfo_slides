---
Title: S02_Linux.md
Author: Yan Li
Date: 01/12/2019, Sun
layout: page
---

# Basic Linux commands

| commands | annotation |
|---------------------------|-------------------------------------------------------------------------------------------------------------|
| bg                        | To send a suspended job to the background                                                                   |
| cat                       | Type a file to the screen (see also more and less)                                                          |
| cat                       | To append files together (cat file1 file2 file3 > newfile)                                                  |
| cd                        | Change directory (cd subdirectory)                                                                          |
| chmod                     | To change the permissions or protection on a file, to allow everyone to read a file (chmod a+r somefile)    |
| clear                     | clear the terminal screen                                                                                   |
| cp filename1 filename2    | create a copy of a file called filename1 and call the copy filename2                                        |
| cp filename directoryName | copy  the file filename into a directory called directoryName                                               |
| cp –R dirName1 dirName2   | copy a whole directory called dirName1 and its contents into another directory called dirName2.             |
| df –k or df -m            | Filesystem information including space usage                                                                |
| emacs                     | A text editor, more powerful than pico, but more complex.                                                   |
| exit                      | Exit the current terminal                                                                                   |
| fg                        | Brings a suspended or background job to the foreground                                                      |
| finger username           | To find more information about a user or users on the system                                                |
| kghostview                | A command for viewing postscript formatted files                                                            |
| grep                      | Search for the occurrence of a pattern                                                                      |
| history                   | List previous commands you have entered                                                                     |
| jobs                      | Lists any suspended or background processes that have running. See also ps and pgrep                        |
| kill pid                  | Kill a process that is running where pid is the process id number                                           |
| last                      | Info about who has logged onto the machine recently                                                         |
| less                      | Type a file to the screen one page at a time (press q to quit, spacebar for next page, b to go back a page) |
| ls                        | List the files in your directory                                                                            |
| ls –l                     | List the files in your directory but with “longer” information                                              |
| man command               | For help about UNIX command command                                                                         |
| man -k keyword            | Lists all UNIX commands that mention the word “keyword”                                                     |
| mkdir dirName             | Make a directory                                                                                            |
| more filename             | Type a file to the screen a page at a time (press q to quit, spacebar for next page).                       |
| mv file1 dirName          |  Move a file called file into a directory called dirName                                                    |
| mv file1 file2            | Rename file1 and call it file2                                                                              |
| nano                      | A basic text editor                                                                                         |
| nedit                     | A nicer text editor                                                                                         |
| passwd                    | Change your password                                                                                        |
| pgrep pattern             | Find process names that contain the pattern. See also ps                                                    |
| pkill processname         | Kill a running process using the process name. See also ps, pgrep and kill                                  |
| pwd                       | Print the full path of your current directory                                                               |
| ps –u                     | List your current processes                                                                                 |
| ps –aux                   | List all processes on the machine. See also top                                                             |
| rm filename               | Delete a file                                                                                               |
| rm –rf dirName            | Delete a directory and all its contents                                                                     |
| rmdir                     | Delete an empty directory                                                                                   |
| top                       | List the processes running that are using the most CPU                                                      |
| touch filename            | Create an empty file                                                                                        |
| who                       | To list users currently logged on                                                                           |
| wget (url)                | Download from a url                                                                                         |
| Cntrl-c                   | Stop a process                                                                                              |
| Cntrl-z                   | Suspend a process, see also jobs, fg and bg                                                                 |
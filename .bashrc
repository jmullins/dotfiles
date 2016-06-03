# .bashrc - sourced for interactive, non-login shells

# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html

# Invoked as an interactive login shell, or with --login When Bash is invoked
# as an interactive login shell, or as a non-interactive shell with the
# --login option, it first reads and executes commands from the file
# /etc/profile, if that file exists. After reading that file, it looks for
# ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and reads
# and executes commands from the first one that exists and is readable.
# The --noprofile option may be used when the shell is started to inhibit
# this behavior.
# 
# Invoked as an interactive non-login shell
# When an interactive shell that is not a login shell is started, Bash reads 
# and executes commands from ~/.bashrc, if that file exists. This may be
# inhibited by using the --norc option. The --rcfile file option will force
# Bash to read and execute commands from file instead of ~/.bashrc.
# 
# So, typically, your ~/.bash_profile contains the line
# if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
# after (or before) any login-specific initializations.
#
# Invoked non-interactively
# When Bash is started non-interactively, to run a shell script, for example,
# it looks for the variable BASH_ENV in the environment, expands its value if
# it appears there, and uses the expanded value as the name of a file to read
# and execute. Bash behaves as if the following command were executed:
#
# if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
# but the value of the PATH variable is not used to search for the filename.
# 
# As noted above, if a non-interactive shell is invoked with the --login option,
# Bash attempts to read and execute commands from the login shell startup files.

# source ~/.path
if [ -f ~/.path ]; then source ~/.path; fi

# source ~/.exports
if [ -f ~/.exports ]; then source ~/.exports; fi

# source ~/.aliases
if [ -f ~/.aliases ]; then source ~/.aliases; fi

# source ~/.bash_prompt
if [ -f ~/.bash_prompt ]; then source ~/.bash_prompt; fi

# source ~/.bash_prompt
if [ -f ~/.extras ]; then source ~/.extras; fi

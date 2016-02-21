shopt -s histappend                # enable history appending instead of overwriting
HISTSIZE=100000                    # remember up to 100.000 entries
HISTFILESIZE=$HISTSIZE             # store as many entries in file as in memory
HISTCONTROL=ignoredups:ignorespace # ignore lines starting with a whitespace, as well as duplicates
HISTTIMEFORMAT="%m/%d/%y %T "      # add timestamp to history lines
HISTIGNORE='ls -l:pwd:date:'       # ignore these commands

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"  

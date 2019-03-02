# master.zshrc is meant to be sourced by all zsh users so be careful
#
# if you are looking instead at ~/.zshrc then do whatever you want!

# please uncomment these two lines in your personal ~/.zshrc:
#export LOCAL_ADMIN_SCRIPTS=/usr/facebook/ops/rc
#source "$LOCAL_ADMIN_SCRIPTS"/master.zshrc

# this keeps you up-to-date with the latest master.zshrc changes; if you opt
# not to, you'll be on your own for keeping up with general changes

# when you copy master.zshrc to ~/.zshrc you don't have to actually keep
#   the remainder of these lines (since they are pulled in by sourcing
#   master.zshrc), though you can (doing them twice is harmless and adds
#   negilble time to the loading of the shell)
# instead you can start making your personal modifications

export LOCAL_ADMIN_SCRIPTS='/usr/facebook/ops/rc'
if [[ -z "$ADMIN_SCRIPTS" ]]; then
  export ADMIN_SCRIPTS="$LOCAL_ADMIN_SCRIPTS"
fi

# things that work in more than just zsh
source "$LOCAL_ADMIN_SCRIPTS"/master.shellrc

# zsh-specific things below

# load zsh completions
fpath=($fpath "$LOCAL_ADMIN_SCRIPTS/zsh-completion")

# Load and run completion initialization
autoload -U compinit
compinit -i

# Enable bash completion for select commands
autoload -U bashcompinit
bashcompinit -i
for f in \
  arcanist \
  bistrocli \
  fbconfig \
  fbmake \
  mlcli \
  mlsweeper \
  smcc \
; do
  source "$LOCAL_ADMIN_SCRIPTS/bash-completion/$f"
done

# Add error code/signal names when a program exits in error (from shellrc)
if test "$ADD_ERRORCODE_TO_PROMPT"; then
   if test "$NO_ERRORCODE_PROMPT" != 1; then
      precmd_functions+=(_errorcode_prompt)
   fi
fi

# More goodness here..

hi="\r\rHi Yann"

printf "${hi} 🚀"
sleep 0.1
printf "${hi} 👻"
sleep 0.1
printf "${hi} 😎"
sleep 0.1
printf "${hi} 🎸"
sleep 0.1
printf "${hi} 🤘\n"

ZSH=$HOME/.oh-my-zsh

# You can change the theme with another one from https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="robbyrussell"

# Useful oh-my-zsh plugins for Le Wagon bootcamps (9/11/21 removed pyenv)
printf "Wanna let ssh-agent manage your SSH 🕵️ ? "
read ssh_active
if ! [ $ssh_active ]
then
  plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search ssh-agent)
  echo "Gotcha, leave it to me 🕵️ !"
else
  plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search)
  echo "Gotcha, let do it old school 🛹 !"
fi

# (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

ZSH_DISABLE_COMPFIX=true
# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed (To manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv (To manage your Python versions)
export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Load nvm if installed (To manage your Node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Load 'lewagon' virtualenv for the Data Bootcamp. You can comment these 2 lines to disable this behavior.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
pyenv activate lewagon 2>/dev/null 
# echo "🐍 Loading 'lewagon' virtualenv"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Alias for student_picker
alias whosnext="sh /Users/yann/github/student-picker/whosnext.sh"

# Misc aliases
alias gst='git status -sb'

alias yanndle="bundle || (gem install bundler && bundle)"

# Path for ANDROID and JAVA
export ANDROID_SDK_ROOT=/Users/yann/Library/Android/sdk
export PATH=${PATH}:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH

# Add olist to python
export PYTHONPATH="/Users/yann/code/yannklein/data-challenges/04-Decision-Science:$PYTHONPATH"
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"
export BUNDLER_EDITOR="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' -a"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yann/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yann/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yann/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yann/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

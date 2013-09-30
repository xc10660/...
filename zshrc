# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wedisagree"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew colored-man cp extract git history-substring-search pip virtualenv zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

setopt hist_ignore_all_dups interactivecomments
unsetopt sharehistory

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

export EDITOR=vim
export SUDO_PROMPT='%p to sudo as %U: '

export PATH=~/.cabal/bin:~/.gem/ruby/1.9.1/bin:~/bin:"$PATH"

stderred_path='/usr/lib/libstderred.so'

if [[ -f $stderred_path ]]; then
	export LD_PRELOAD="${stderred_path}${LD_PRELOAD:+:$LD_PRELOAD}"
fi

# Only call the slow git_prompt_status function when we really want it.
git_prompt_status_t() {
	if [[ -n "$GIT_PROMPT_STATUS_ON" ]]; then
		git_prompt_status
	fi
}

# Toggle the slow part of the right prompt. Off by default, to speed things up.
rptoggle() {
	if [[ -n "$GIT_PROMPT_STATUS_ON" ]]; then
		GIT_PROMPT_STATUS_ON=
	else
		GIT_PROMPT_STATUS_ON=1
	fi
}

alias :q=exit
alias :Q=exit

alias t=true
alias nil=false

if [[ "$(uname)" == 'Darwin' ]]; then
   # BSD ls
   alias ls='ls -FGh'
else
   # GNU ls
   alias ls='ls --color=auto --classify --human-readable'
fi

alias grep='grep --color=auto --line-number'
alias gst='git status --short --branch'
alias pun='phpunit --colors --verbose'
alias ta='tmux attach'
alias vlc='vlc --extraintf oldrc --rc-unix /tmp/vlc.sock'

if [[ -f ~/.zshrc.local ]]; then
	source ~/.zshrc.local
fi

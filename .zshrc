fastfetch
export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"
source <(fzf --zsh)

# Auto suggestions and syntax highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf tab
autoload -U compinit; compinit
source ~/code/fzf-tab/fzf-tab.plugin.zsh

# Work related stuff
if [[ -f ~/.zshrc_work ]]; then
    source ~/.work
fi

# CUSTOM ALIAS
alias glog='git log --pretty=format:"%C(yellow)%h%Creset -%C(green) %an%Creset, %C(cyan)%ar%Creset: %s"'
alias lazy="python3 ~/code/lazy-jira-search/main.py"
alias ls="lsd"

# CUSTOM FUNCTIONS
checkoutf() {
    git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout
}

mkdirg () {
	mkdir -p $1
	cd $1
}

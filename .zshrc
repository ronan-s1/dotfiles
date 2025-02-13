# ON LOAD
fastfetch
eval "$(starship init zsh)"
source <(fzf --zsh)
cd ~/code

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit; compinit
source ~/code/fzf-tab/fzf-tab.plugin.zsh

# CUSTOM ALIAS
alias glog='git log --pretty=format:"%C(yellow)%h%Creset -%C(green) %an%Creset, %C(cyan)%ar%Creset: %s"'
alias lazy="python3 ~/code/lazy-jira-search/main.py"
alias ls="lsd"

# CUSTOM FUNCTIONS
checkoutf() {
    git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout
}

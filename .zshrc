eval "$(starship init zsh)"
source <(fzf --zsh)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/code/fzf-tab/fzf-tab.plugin.zsh

alias lazy="python3 ~/code/lazy-jira-search/main.py"
alias ls="lsd"
alias grep="grep --color=always"
alias vf='vim $(fzf)'

checkoutf() {
    git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout
}

autoload -U compinit; compinit
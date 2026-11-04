fastfetch
export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# zf-tab
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# Auto suggestions and syntax highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf tab
autoload -U compinit; compinit
source ~/code/personal/fzf-tab/fzf-tab.plugin.zsh
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# Work related stuff
if [[ -f ~/.work ]]; then
    source ~/.work
fi

# CUSTOM ALIAS
alias glog='git log --pretty=format:"%C(yellow)%h%Creset -%C(green) %an%Creset, %C(cyan)%ar%Creset: %s"'
alias ls="lsd"
alias reload="source ~/.zshrc"

# CUSTOM FUNCTIONS
checkoutf() {
    git branch | grep -v "^\*" | fzf --height=20% --reverse --info=inline | xargs git checkout
}

mkdirg() {
	mkdir -p $1
	cd $1
}

openr() {
    open "$(git config --get remote.origin.url)" 
}

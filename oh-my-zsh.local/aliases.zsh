# Use bat instead of cat
alias cat='bat'

# Use bat for file previews using fzf
alias fp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

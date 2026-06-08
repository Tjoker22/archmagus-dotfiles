# 1. System & Path Initializations
export PATH="$HOME/.local/bin:$PATH"

# 2. Initialize Core Tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# 3. Initialize Zsh Completion System (CRITICAL MISSING PIECE)
autoload -Uz compinit
compinit

# 4. Aliases
alias ls='eza -a --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first'
alias lt='eza --tree --icons --level=2'
alias cat='bat'
alias cd='z'
alias vim='nvim'
alias lg='lazygit'

# 5. FZF Configuration
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'

# Source FZF bindings (Now safe because compinit is loaded)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# 6. Bash-like Up/Down Arrow History Search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# 7. SSH Agent Setup
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add ~/.ssh/id_ed25519 2>/dev/null

# 8. Plugins (Sourced last, with syntax highlighting at the very end)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# opencode
export PATH=/home/yoyo/.opencode/bin:$PATH

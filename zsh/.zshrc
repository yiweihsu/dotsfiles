# --- 1. Path & Environment Variables ---

# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Java & Antigravity
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk"
export PATH="/Users/yiwei/.antigravity/antigravity/bin:$PATH"
export EDITOR='vim'

# --- 2. Zsh Core Settings (Fixing the "Raw" feel) ---

# Initialize completion system
autoload -Uz compinit
compinit

# [FIX 1] Enable Menu Selection (Use arrow keys to select folders)
zstyle ':completion:*' menu select

# [FIX 2] Case Insensitive Completion (e.g. 'cd doc' matches 'Documents')
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# [FIX 3] Colored completion list
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# History Settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# --- 3. Modern Tools ---

# Starship
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Zoxide (Smart cd)
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# Autosuggestions & Syntax Highlighting
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --- 4. NVM ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- 5. AI Tools ---

# GitHub Copilot CLI
if command -v copilot &> /dev/null; then
    function ask_copilot() {
        if [ -z "$1" ]; then
            copilot
        else
            copilot -p "Show me the shell command to: $* . Do not execute it, just display the command and a brief explanation."
        fi
    }
    alias '??'='ask_copilot'
fi

# Codex CLI
if command -v codex &> /dev/null; then
    alias cx='codex'
    function cxe() {
        if [ -z "$1" ]; then echo "Usage: cxe <prompt>"; else codex exec "$*"; fi
    }
    function cxa() {
        if [ -z "$1" ]; then echo "Usage: cxa <prompt>"; else echo "⚠️  FULL AUTO"; codex --full-auto "$*"; fi
    }
fi

# --- 6. Aliases ---

alias src="source ~/.zshrc && echo 'Zsh config reloaded!'"
alias zshconfig="code ~/.zshrc"

# [FIX 4] Show full history by default
alias history="history 1"

# Git Aliases
alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias glog="git log --oneline --graph --decorate"

# LS colors
alias ls="ls -G"
alias ll="ls -Glh"
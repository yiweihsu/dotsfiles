# ==============================================
# Yiwei's Pure Zsh Config (No Oh My Zsh)
# ==============================================

# --- 1. Path & Environment Variables ---

# Homebrew Setup (Standard for Apple Silicon)
if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Java Home
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk"

# Antigravity
export PATH="/Users/yiwei/.antigravity/antigravity/bin:$PATH"

# Editor
export EDITOR='vim'

# --- 2. Basic Zsh Settings (Since we removed OMZ) ---

# Initialize the completion system (Required for Tab completion)
autoload -Uz compinit
compinit

# History Settings (So you can press Up arrow)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
# Don't save duplicate commands
setopt HIST_IGNORE_DUPS
# Appends history to the file rather than overwriting
setopt APPEND_HISTORY
# Shares history across multiple terminal windows
setopt SHARE_HISTORY

# --- 3. Modern Tools (The Speed Layer) ---

# Starship: Blazing fast prompt
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
fi

# Zoxide: Smarter 'cd'
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi

# Zsh Autosuggestions (Gray text suggestions)
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Zsh Syntax Highlighting (Colors)
# Note: Must be loaded LAST
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# --- 4. NVM (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- 5. AI Tools ---

# GitHub Copilot CLI (Suggestion Mode)
if command -v copilot &> /dev/null; then
    function ask_copilot() {
        if [ -z "$1" ]; then
            copilot
        else
            # Mimic old 'suggest' behavior
            copilot -p "Show me the shell command to: $* . Do not execute it, just display the command and a brief explanation."
        fi
    }
    alias '??'='ask_copilot'
fi

# Codex CLI Configuration
if command -v codex &> /dev/null; then
    alias cx='codex'
    
    function cxe() {
        if [ -z "$1" ]; then
            echo "Usage: cxe <prompt>"
        else
            codex exec "$*"
        fi
    }

    function cxa() {
        if [ -z "$1" ]; then
            echo "Usage: cxa <prompt>"
        else
            echo "⚠️  Running Codex in FULL AUTO mode..."
            codex --full-auto "$*"
        fi
    }
fi

# --- 6. Aliases ---

# Reload Zsh
alias src="source ~/.zshrc && echo 'Zsh config reloaded!'"
alias zshconfig="code ~/.zshrc"

# Git Aliases (Since we removed the git plugin, we define essentials manually)
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
# 🛠️ My Dotfiles

Minimal, fast setup for macOS using **Ghostty** + **Zsh** + **Starship**.

## ⚡️ Quick Setup

### 1. Clone & Install Dependencies

Assumes you have [Homebrew](https://brew.sh) installed.

```bash
# 1. Clone repo
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Install all dependencies using Brewfile
brew bundle install
```

### 2. Link Dotfiles (Stow)

Move existing configs aside to avoid conflicts, then link the new ones.

```bash
# 1. Backup old configs (ignore errors if files don't exist)
mv ~/.zshrc ~/.zshrc.bak
mv ~/.zshenv ~/.zshenv.bak
mv ~/.zprofile ~/.zprofile.bak
mv ~/.config/ghostty/config ~/.config/ghostty/config.bak
mv ~/.config/starship.toml ~/.config/starship.toml.bak

# 2. Link files using stow
cd ~/dotfiles
stow zsh
stow ghostty
stow starship
```

### 3. Finalize

```bash
# Refresh Shell
source ~/.zshrc
```

---

## 📦 What's Included

### Shell & Prompt
- **Zsh** - Shell configuration with .zshrc, .zshenv, and .zprofile
- **Starship** - Fast, customizable prompt
- **Zoxide** - Smarter cd command

### Terminal
- **Ghostty** - Modern, fast terminal emulator

### Development Tools
- **nvm** - Node.js version manager
- **pyenv** - Python version manager

### Shell Enhancement
- **zsh-autosuggestions** - Fish-like autosuggestions
- **zsh-syntax-highlighting** - Real-time syntax highlighting

---

## ⌨️ Shell Shortcuts

| Command     | Description                                               |
| :---------- | :-------------------------------------------------------- |
| `z <dir>`   | Smart jump to directory (e.g., `z dot` -> `~/dotfiles`). |
| `src`       | Reload `.zshrc`.                                          |

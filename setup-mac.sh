#!/bin/bash

# Mac Setup Script
# Based on: https://gist.github.com/alanzeino/42b6d983c7aa2f29d64ea2749621f7cf

set -e  # Exit on error

echo "Starting Mac setup..."

# ============================================
# macOS System Preferences
# ============================================

echo "Configuring macOS defaults..."

# Window Management
defaults write AppleMiniaturizeOnDoubleClick -bool true

# Dock Settings
defaults write com.apple.dock slow-motion-allowed -bool YES
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock magnification -bool false

# Finder Settings
defaults write com.apple.finder CreateDesktop false
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Global Settings
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain AppleMenuBarVisibleInFullscreen -int 1

# Trackpad Settings
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Safari Settings
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari ShowFavoritesBar -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari ShowOverlayStatusBar -bool true

# Xcode Settings
defaults write com.apple.dt.Xcode DVTTextShowLineNumbers -bool true
defaults write com.apple.dt.Xcode DVTTextShowFoldingSidebar -bool true
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool true
defaults write com.apple.dt.Xcode IDEIndexShowLog YES

# Mail Settings
defaults write com.apple.mail-shared DisableURLLoading -bool true

echo "Restarting Dock and Finder..."
killall Dock
killall Finder

# ============================================
# Shell Configuration
# ============================================

echo ""
echo "Note: You may need to manually configure the following:"
echo ""
echo "1. For Starship (add to ~/.zshrc):"
echo "   command_timeout = 3000"
echo "   [battery]"
echo "   disabled = true"
echo ""
echo "2. For Fish shell, run these commands:"
echo "   fisher install decors/fish-colored-man"
echo "   fisher install jethrokuan/z"
echo "   fisher install jorgebucaran/hydro"
echo ""
echo "3. For zsh key bindings (add to ~/.zshrc):"
echo "   autoload -U up-line-or-beginning-search"
echo "   autoload -U down-line-or-beginning-search"
echo "   zle -N up-line-or-beginning-search"
echo "   zle -N down-line-or-beginning-search"
echo "   bindkey \"^[[A\" up-line-or-beginning-search"
echo "   bindkey \"^[[B\" down-line-or-beginning-search"
echo ""

echo "Setup complete!"

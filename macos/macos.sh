#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS settings..."

# Disable Natural Scrolling
echo "Disabling Natural Scrolling..."
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable Spotlight shortcuts
echo "Disabling Spotlight shortcuts..."
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; }"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 "{ enabled = 0; }"

# Disable "Click wallpaper to show desktop"
echo "Disabling 'Click wallpaper to show desktop'..."
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Dock settings
echo "Configuring Dock settings..."
defaults write com.apple.dock orientation -string "right"
defaults write com.apple.dock mineffect -string "scale"
defaults write -g AppleActionOnDoubleClick -string "Maximize"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool false

# Stage Manager and Desktop
echo "Configuring Stage Manager and Desktop settings..."
defaults write com.apple.WindowManager GloballyEnabled -bool false
defaults write com.apple.WindowManager StandardHideDesktopIcons -bool true
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
defaults write com.apple.WindowManager EnableStageManagerClickToShowDesktop -bool true
defaults write com.apple.WindowManager StageManagerShowRecentApps -bool false

killall SystemUIServer
echo "✅ macOS settings applied. Some changes may require logout/restart."
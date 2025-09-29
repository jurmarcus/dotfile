#!/usr/bin/env bash
set -euo pipefail

echo "Applying macOS settings..."

# Disable Natural Scrolling
echo "Disabling Natural Scrolling..."
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Remap Caps Lock to Control
echo "Remapping Caps Lock to Control..."
hidutil property --set '{
    "UserKeyMapping": [
        {"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E0}
    ]
}'

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

# Trackpad: tracking speed 10/10 (max)
echo "Setting trackpad tracking speed to max (10/10)…"
defaults write -g com.apple.trackpad.scaling -float 3.0

# Trackpad: enable Tap to click
echo "Enabling Tap to click…"
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1

# Trackpad: enable three finger drag
echo "Enabling three finger drag for trackpad…"
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

killall SystemUIServer
killall Dock
echo "✅ macOS settings applied. Some changes may require logout/restart."

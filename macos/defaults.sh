# Free the Dock
defaults write com.apple.Dock size-immutable -bool no; killall Dock

# Remove the auto-hiding Dock delay
defaults write com.apple.Dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.Dock autohide-time-modifier -float 0

# Set the icon size of Dock items
defaults write com.apple.Dock tilesize -int 28

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1 # normal minimum is 2 (30 ms)
defaults write NSGlobalDomain InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Enable font smoothing
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO

# Enable subpixel font rendering on non-Apple LCDs
# https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
defaults write NSGlobalDomain AppleFontSmoothing -int 1

# Lock the Dock size
defaults write com.apple.Dock size-immutable -bool yes; killall Dock

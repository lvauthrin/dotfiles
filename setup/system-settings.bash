#!/usr/bin/env bash

# Mac OS System Settings

## Trackpad ##
# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Disable tap to click
defaults -currentHost write -globalDomain com.apple.mouse.tapBehavior -int 0
# Apply trackpad settings
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
## Trackpad ##

## Dock ##
# Auto-hide
defaults write com.apple.dock "autohide" -bool "true"
# Disable recent applications/documents
defaults write com.apple.dock "show-recents" -bool "true"
# Only show opened applications
defaults write com.apple.dock "static-only" -bool "true"
# Disable bouncing
defaults write com.apple.dock "no-bouncing" -bool "true"
# Set the dock to show after 2 seconds
defaults write com.apple.dock "autohide-delay" -float "2.0"
# Restart the Dock process
killall Dock;
## Dock ##

## Finder ##
# Display file extentions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show hidden extentions
defaults write com.apple.Finder AppleShowAllFiles -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Set home folder as default
defaults write com.apple.finder NewWindowTarget PfHm
# Set current folder as default search scope
defaults write com.apple.finder FXDefaultSearchScope SCcf
# Hide tags in sidebar.
defaults write com.apple.finder ShowRecentTags -bool false
# Restart Finder
killall Finder
## Finder ##

## Keyboard ##
# Enable repeating keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Set blazingly fast key repeat rate.
defaults write NSGlobalDomain KeyRepeat -int 1
# Set blazingly fast initial key repeat rate.
defaults write NSGlobalDomain InitialKeyRepeat -int 12
# Disable period after double space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -int 0
## Keyboard ##

# Prevent Photos from opening automatically when devices are plugged in.
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Show battery percentage
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true

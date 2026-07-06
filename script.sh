# Install Homebrew
if ! command -v brew &> /dev/null; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed."
fi

# Inject brew into PATH
echo "\n#Homebrew" > ~/.zshrc
/opt/homebrew/bin/brew shellenv > ~/.zshrc
source ~/.zshrc

# Install Apps
brew install --cask \
  google-chrome \
  zed \
  claude-code \
  ghostty \
  mongodb-compass \
  obsidian \
  onlyoffice 

# Install CLI Tools for customization
brew install \
  duti \
  dockutil

# Change Defaults on mac
duti -s com.mitchellh.ghostty ssh
duti -s com.google.chrome http
duti -s com.google.chrome https

# Purge Dock
dockutil --remove all --no-restart

# Set Apps on Dock
dockutil --add '/System/Applications/Apps.app' --position 1
# dockutil --add '/System/Applications/Launchpad.app' --position 1
dockutil --add '/Applications/Google Chrome.app' --position 2
dockutil --add '/Applications/Ghostty.app'  --position 3
dockutil --add '/Applications/Zed.app'  --position 4
dockutil --add '/System/Applications/Notes.app'  --position 5
dockutil --add '/Applications/Obsidian.app'  --position 6

# Resize Dock
defaults write com.apple.dock tilesize -int 48 

# Set DOCK on left of Screen
defaults write com.apple.dock orientation -string "left"

# Turn on "Snap to Grid" on Desktop
defaults write com.apple.finder DesktopViewSettings -dict-add ArrangeBy -string "grid"

# Adjust Desktop grid spacing
defaults write com.apple.finder DesktopViewSettings -dict-add GridSpacing -int 54

# Hide the Tags from Finder
defaults write com.apple.finder ShowRecentTags -bool false

# Don't Create .DS_Store on Network Devices
defaults write com.apple.desktopservices  -bool true

# Don't Create .DS_Store on USB Devices
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Set Widget Style to Always Monochrome
defaults write com.apple.widgets widgetAppearance -int 0

# Secondary Click on bottom-right corner
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 2
defaults write -g com.apple.trackpad.trackpadCornerClickBehavior -int 1 

# Turn off the suggested and recent apps on dock
defaults write com.apple.dock show-recents -bool false

# Lock on Lid Down
sudo sysadminctl -screenLock immediate -password -

# Remove Junk
bash -c "sudo rm -rf /Applications/{GarageBand,Keynote,Numbers,iMovie,Pages}.app"

# Restart Things
# killall cfprefsd
# killall Finder
# killall Dock
# killall NotificationCenter

#
echo "Restarting..."
sudo shutdown -r now

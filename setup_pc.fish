#!/bin/fish
function install_git
  echo "Updating and upgrading packages..."
  sudo apt update && sudo apt upgrade -y
  echo "Installing git..."
  sudo apt install git
  $git_version = git --version
  echo "Installed $git_version"
end

function config_git_aliases
  echo "Configuring git aliases..."
  git config --global alias.st status
  git config --global alias.cout checkout
  git config --global alias.coutb 'checkout -b'
  git config --global alias.cim 'commit -m'
  echo "Git aliases configured."
end

if which git
  config_git_aliases
else
  install_git
  config_git_aliases
end

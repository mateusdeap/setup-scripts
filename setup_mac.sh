#! /bin/bash

if ! command -v brew &> /dev/null
then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  "Brew installed"
else
  echo "Brew already installed!"
fi

if ! command -v fish &> /dev/null
then
  echo "Installing fish shell..."
  brew install fish  
  curl -L https://get.oh-my.fish | fish
  sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
  chsh -s /usr/local/bin/fish
  echo "Fish installed"
else
  echo "Fish already installed!"
fi

if ! command -v gh &> /dev/null
then
  echo "Installing GitHub CLI..."
  brew install gh
  gh auth login --with-token < gh_token
  echo "GitHub CLI installed"
else
  echo "GitHub CLI already installed!"
fi

echo "Configuring git aliases..."
git config --global alias.st status
git config --global alias.cout checkout
git config --global alias.coutb 'checkout -b'
git config --global alias.cim 'commit -m'
echo "Git aliases configured."


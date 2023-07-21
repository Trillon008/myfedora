!include /usr/share/ublue-os/just/bling.just

# install all flatpaks defined in recipe.yml
setup-flatpaks:
  #!/usr/bin/env bash
  echo 'Installing flatpaks from the ublue recipe ...'
  flatpaks=$(yq -- '.firstboot.flatpaks[]' "/usr/share/ublue-os/recipe.yml")
  for pkg in $flatpaks; do \
      echo "Installing: ${pkg}" && \
      flatpak install --user --noninteractive flathub $pkg; \
  done

# Include some of your custom scripts here! 
## Install Terminus Nerd Font 
setup-nerdfont:
  #!/usr/bin/env bash
  echo 'Installing nerdfonts in home directory...'
  tmppath=/tmp/terminus
  mkdir ${tmppath}
  wget -P ${tmppath} "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Terminus.zip"
  unzip ${tmppath}/Terminus.zip 
  if [ ! -d ${HOME}/.fonts ] then;
    mkdir ${HOME}/.fonts
  fi
  mv ${tmppath}/*.ttf ${HOME}/.fonts/
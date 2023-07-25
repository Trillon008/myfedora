!include /usr/share/ublue-os/just/bling.just

# install all flatpaks defined in recipe.yml
setup-flatpaks:
  #!/usr/bin/env bash
  echo 'Installing flatpaks from the ublue recipe ...'
  flatpaks=$(yq -- '.firstboot.flatpaks[]' "/usr/share/ublue-os/recipe.yml")
  for pkg in $flatpaks; do \
      echo "Installing: ${pkg}" && \
      flatpak install  --noninteractive flathub $pkg; \
  done

# Include some of your custom scripts here! 
## Install Terminus Nerd Font 
setup-nerdfont:
  #!/usr/bin/env bash
  echo 'Installing nerdfonts in home directory...'
  tmppath=/tmp/terminus
  mkdir ${tmppath}
  wget -P ${tmppath} 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Terminus.zip'
  unzip ${tmppath}/Terminus.zip -d ${tmppath}
  if [ ! -d ${HOME}/.fonts ]; then
    mkdir ${HOME}/.fonts
    mv ${tmppath}/*.ttf ${HOME}/.fonts/  
  fi

# Install flathub remote
install-flathub:
  #!/usr/bin/env bash 
  echo 'Remove fedora remote and add flathub'
  flatremote=$(flatpak remotes --columns=name)
  if [[ ${flatremote} ]] == 'fedora' ]; then
    flatpak remote-delete fedora
  fi
  flatpak remote-add flathub --if-not-exists flathub 'https://dl.flathub.org/repo/flathub.flatpakrepo'
  unset ${flatremote}
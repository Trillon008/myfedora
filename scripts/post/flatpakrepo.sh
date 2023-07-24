#!/usr/bin/env bash 

set -oue pipefail

# flatremote=$(flatpak remotes --columns=name)
# if [ ${flatremote} ] == 'fedora ']; then
#   flatpak remote-delete fedora
#   flatpak remote-add flathub --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
# fi
# unset ${flatremote}
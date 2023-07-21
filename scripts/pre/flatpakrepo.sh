#!/usr/bin/env bash 

set -oue pipefail
echo "Test"

# flatpak remote-delete fedora
# flatpak remote-add flathub --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

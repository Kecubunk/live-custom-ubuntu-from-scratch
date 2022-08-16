#!/bin/bash

# This script provides common customization options for the ISO
# 
# Usage: Copy this file to config.sh and make changes there.  Keep this file (default_config.sh) as-is
#   so that subsequent changes can be easily merged from upstream.  Keep all customiations in config.sh

# The version of Ubuntu to generate.  Successfully tested: bionic, cosmic, disco, eoan, focal, groovy
# See https://wiki.ubuntu.com/DevelopmentCodeNames for details
export TARGET_UBUNTU_VERSION="jammy"

# The Ubuntu Mirror URL. It's better to change for faster download.
# More mirrors see: https://launchpad.net/ubuntu/+archivemirrors
export TARGET_UBUNTU_MIRROR="http://us.archive.ubuntu.com/ubuntu/"

# The packaged version of the Linux kernel to install on target image.
# See https://wiki.ubuntu.com/Kernel/LTSEnablementStack for details
export TARGET_KERNEL_PACKAGE="linux-generic"

# The file (no extension) of the ISO containing the generated disk image,
# the volume id, and the hostname of the live environment are set from this name.
export TARGET_NAME="ubuntu-from-scratch"

# The text label shown in GRUB for booting into the live environment
export GRUB_LIVEBOOT_LABEL="Try Ubuntu FS without installing"

# The text label shown in GRUB for starting installation
export GRUB_INSTALL_LABEL="Install Ubuntu FS"

# Packages to be removed from the target system after installation completes succesfully
export TARGET_PACKAGE_REMOVE="
    ubiquity \
    casper \
    discover \
    laptop-detect \
    os-prober \
"

# Package customisation function.  Update this function to customize packages
# present on the installed system.
function customize_image() {
    # install graphics and desktop
    apt-get install -y \
    plymouth-theme-ubuntu-logo \
    tasksel install xubuntu-desktop \
    ubuntu-gnome-wallpapers

    # useful tools
    apt-get install -y \
    clamav-daemon \
    apt-transport-https \
    curl \
    nano \
    arduino \
    fonts-powerline \
    conky \
    neofetch \
    meld \
    kate
    
   
    # minimized sized (make it slim)
    apt-get purge --ignore-missing -y \ 
    hexchat \
    thunderbird \
    transmission-gtk \
    gnome-todo \
    baobab \
    rhythmbox \
    cheese \
    vino \
    shotwell \
    totem \
    deja-dup \
    gnome-calendar \
    remmina \
    simple-scan \
    thunderbird-gnome-support \
    aisleriot \
    hitori \
    gnome-mahjongg \
    gnome-mines \
    gnome-sudoku \
    branding-ubuntu \
    libreoffice-style-breeze \
    libreoffice-gnome \
    libreoffice-writer \
    libreoffice-calc \
    libreoffice-impress \
    libreoffice-math \
    libreoffice-ogltrans \
    libreoffice-pdfimport \
    example-content \
    libreoffice-l10n-en-gb \
    libreoffice-l10n-es \
    libreoffice-l10n-zh-cn \
    libreoffice-l10n-zh-tw \
    libreoffice-l10n-pt \
    libreoffice-l10n-pt-br \
    libreoffice-l10n-de \
    libreoffice-l10n-fr \
    libreoffice-l10n-it \
    libreoffice-l10n-ru \
    libreoffice-l10n-en-za \
    libreoffice-help-en-gb \
    libreoffice-help-es \
    libreoffice-help-zh-cn \
    libreoffice-help-zh-tw \
    libreoffice-help-pt \
    libreoffice-help-pt-br \
    libreoffice-help-de \
    libreoffice-help-fr \
    libreoffice-help-it \
    libreoffice-help-ru \
    libreoffice-help-en-us \
    thunderbird-locale-en \
    thunderbird-locale-en-gb \
    thunderbird-locale-en-us \
    thunderbird-locale-es \
    thunderbird-locale-es-ar \
    thunderbird-locale-es-es \
    thunderbird-locale-zh-cn \
    thunderbird-locale-zh-hans \
    thunderbird-locale-zh-hant \
    thunderbird-locale-zh-tw \
    thunderbird-locale-pt \
    thunderbird-locale-pt-br \
    thunderbird-locale-pt-pt \
    thunderbird-locale-de \
    thunderbird-locale-fr \
    thunderbird-locale-it \
    thunderbird-locale-ru \
    gir1.2-rb-3.0 \
    gir1.2-totem-1.0 \
    gir1.2-totemplparser-1.0 \
    libabw-0.1-1 \
    libavahi-ui-gtk3-0 \
    libdmapsharing-3.0-2 \
    libexttextcat-2.0-0 \
    libexttextcat-data \
    libfreehand-0.1-1 \
    libgnome-games-support-1-3 \
    libgnome-games-support-common \
    libgom-1.0-0 \
    libgrilo-0.3-0 \
    liblangtag-common \
    liblangtag1 \
    libmessaging-menu0 \
    libmhash2 \
    libmwaw-0.3-3 \
    libmythes-1.2-0 \
    libnatpmp1 \
    libneon27-gnutls \
    libpagemaker-0.0-0 \
    librdf0 \
    libreoffice-avmedia-backend-gstreamer \
    libreoffice-base-core \
    libreoffice-common \
    libreoffice-core \
    libreoffice-draw \
    libreoffice-gtk3 \
    libreoffice-style-elementary \
    libreoffice-style-galaxy \
    libreoffice-style-tango \
    libraptor2-0 \
    librasqal3 \
    librevenge-0.0-0 \
    librhythmbox-core10 \
    libtotem0 \
    libvisio-0.1-1 \
    libwpd-0.10-10 \
    libwpg-0.3-3 \
    libwps-0.4-4 \
    libyajl2 \
    python3-uno \
    rhythmbox-data \
    rhythmbox-plugin-alternative-toolbar \
    rhythmbox-plugins \
    remmina-common \
    remmina-plugin-rdp \
    remmina-plugin-secret \
    remmina-plugin-vnc \
    duplicity \
    seahorse-daemon \
    shotwell-common \
    totem-common \
    totem-plugins \
    transmission-common \
    cheese-common \
    gnome-todo-common \
    libgnome-todo \
    gnome-video-effects \
    libcheese-gtk25 \
    libcheese8 \
    ure \
    zeitgeist-core \
    hunspell-de-at-frami \
    hunspell-de-ch-frami \
    hunspell-de-de-frami \
    hunspell-en-au \
    hunspell-en-ca \
    hunspell-en-gb \
    hunspell-en-za \
    hunspell-es \
    hunspell-fr \
    hunspell-fr-classical \
    hunspell-it \
    hunspell-pt-br \
    hunspell-pt-pt \
    hunspell-ru \
    hyphen-de \
    hyphen-en-ca \
    hyphen-en-gb \
    hyphen-en-us \
    hyphen-fr \
    hyphen-hr \
    hyphen-it \
    hyphen-pl \
    hyphen-pt-br \
    hyphen-pt-pt \
    hyphen-ru \
    mythes-de \
    mythes-de-ch \
    mythes-en-au \
    mythes-en-us \
    mythes-fr \
    mythes-it \
    mythes-pt-pt \
    mythes-ru
}

# Used to version the configuration.  If breaking changes occur, manual
# updates to this file from the default may be necessary.
export CONFIG_FILE_VERSION="0.4"

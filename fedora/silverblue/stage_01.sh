rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

rpm-ostree override remove gnome-system-monitor gnome-tour gnome-user-docs yelp


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak remove org.fedoraproject.MediaWriter org.gnome.Contacts org.gnome.Weather org.gnome.clocks org.gnome.eog

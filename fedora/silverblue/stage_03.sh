rpm-ostree override remove gnome-system-monitor gnome-tour gnome-user-docs yelp


###########################################################


echo "pleroma" > /etc/hostname


###########################################################


usermod --shell /bin/fish gbrlgn


###########################################################


rpm-ostree upgrade
flatpak upgrade

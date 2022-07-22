#!/bin/sh


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


flatpak install flathub org.gtk.Gtk3theme.adw-gtk3-dark \ 
com.belmoussaoui.Authenticator \
org.gnome.World.Secrets \
io.bassi.Amberol \
com.usebottles.bottles \
io.github.celluloid_player.Celluloid \
org.gnome.World.Citations \
re.sonny.Commit \
com.belmoussaoui.Decoder \
com.github.gi_lom.dialect \
org.gabmus.gfeeds \
com.github.tchx84.Flatseal \
org.gustavoperedo.FontDownloader \
org.gnome.Fractal \
de.haeckerfelix.Fragments \
org.gaphor.Gaphor \
org.gnome.Geary \
dev.geopjr.Collision \
org.gimp.GIMP \
org.inkscape.Inkscape \
re.sonny.Junction \
fr.romainvigier.MetadataCleaner \
com.obsproject.Studio \
org.onlyoffice.desktopeditors \
com.github.johnfactotum.QuickLookup \
com.github.flxzt.rnote \
org.gnome.Shotwell \
com.spotify.Client \
com.github.liferooter.textpieces \
org.gabmus.whatip \
com.github.hugolabe.Wike --assumeyes

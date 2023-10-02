#!/bin/sh


flatpak remote-add --if-not-exists flathub \
	https://flathub.org/repo/flathub.flatpakrepo


flatpak install flathub \
	org.gtk.Gtk3theme.adw-gtk3-dark \
	com.belmoussaoui.Authenticator \
	org.gnome.World.Secrets \
	io.bassi.Amberol \
	com.usebottles.bottles \
	io.github.celluloid_player.Celluloid \
	org.gnome.World.Citations \
	re.sonny.Commit \
	org.gnome.Connections \
	io.dbeaver.DBeaverCommunity \
	com.belmoussaoui.Decoder \
	com.github.gi_lom.dialect \
	io.github.cleomenezesjr.Escambo \
	org.gabmus.gfeeds \
	com.github.tchx84.Flatseal \
	org.gustavoperedo.FontDownloader \
	org.gnome.Fractal \
	de.haeckerfelix.Fragments \
	org.gaphor.Gaphor \
	org.gnome.Geary \
	com.github.GradienceTeam.Gradience \
	dev.geopjr.Collision \
	org.gimp.GIMP \
	de.gunibert.Hackgregator \
	org.inkscape.Inkscape \
	re.sonny.Junction \
	org.gnome.Logs \
	fr.romainvigier.MetadataCleaner \
	org.libretro.RetroArch \
	com.obsproject.Studio \
	org.onlyoffice.desktopeditors \
	com.github.johnfactotum.QuickLookup \
	com.github.ADBeveridge.Raider \
	com.github.flxzt.rnote \
	org.gnome.Shotwell \
	com.github.liferooter.textpieces \
	app.drey.Warp \
	org.gabmus.whatip \
	com.github.hugolabe.Wike --assumeyes

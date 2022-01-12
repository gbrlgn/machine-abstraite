flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark 
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub com.vscodium.codium
flatpak install flathub re.sonny.Commit
flatpak install flathub com.github.gi_lom.dialect
flatpak install flathub org.gustavoperedo.FontDownloader
flatpak install flathub org.gnome.Fractal
flatpak install flathub de.haeckerfelix.Fragments
flatpak install flathub org.gaphor.Gaphor
flatpak install flathub org.gnome.Geary
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.freedesktop.Sdk.Extension.golang
flatpak install flathub dev.geopjr.Hashbrown
flatpak install flathub org.freedesktop.Sdk.Extension.haskell
flatpak install flathub org.inkscape.Inkscape
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community
flatpak install flathub re.sonny.Junction
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12
flatpak install flathub fr.romainvigier.MetadataCleaner
flatpak install flathub org.gnome.Music
flatpak install flathub com.gitlab.newsflash
flatpak install flathub org.freedesktop.Sdk.Extension.node16
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17
flatpak install flathub org.gnome.PasswordSafe
flatpak install flathub org.freedesktop.Sdk.Extension.php80
flatpak install flathub org.gnome.Podcasts
flatpak install flathub com.jetbrains.PyCharm-Community
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable
flatpak install flathub org.gnome.Shotwell
flatpak install flathub com.spotify.Client
flatpak install flathub re.sonny.Tangram
flatpak install flathub com.github.liferooter.textpieces
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64
flatpak install flathub com.github.hugolabe.Wike


flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.IntelliJ-IDEA-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.PyCharm-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.vscodium.codium


flatpak upgrade

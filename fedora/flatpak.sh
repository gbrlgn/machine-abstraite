flatpak install flathub org.gtk.Gtk3theme.Adwaita-dark --assumeyes
flatpak install flathub org.gnome.World.Secrets --assumeyes
flatpak install flathub io.github.celluloid_player.Celluloid --assumeyes
flatpak install flathub com.vscodium.codium --assumeyes
flatpak install flathub re.sonny.Commit --assumeyes
flatpak install flathub com.github.gi_lom.dialect --assumeyes
flatpak install flathub org.gustavoperedo.FontDownloader --assumeyes
flatpak install flathub org.gnome.Fractal --assumeyes
flatpak install flathub de.haeckerfelix.Fragments --assumeyes
flatpak install flathub org.gaphor.Gaphor --assumeyes
flatpak install flathub org.gnome.Geary --assumeyes
flatpak install flathub org.gimp.GIMP --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.golang --assumeyes
flatpak install flathub dev.geopjr.Hashbrown --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.haskell --assumeyes
flatpak install flathub org.inkscape.Inkscape --assumeyes
flatpak install flathub com.jetbrains.IntelliJ-IDEA-Community --assumeyes
flatpak install flathub re.sonny.Junction --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.llvm12 --assumeyes
flatpak install flathub fr.romainvigier.MetadataCleaner --assumeyes
flatpak install flathub org.gnome.Music --assumeyes
flatpak install flathub com.gitlab.newsflash --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.node16 --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.openjdk17 --assumeyes
flatpak install flathub com.jetbrains.PyCharm-Community --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.rust-stable --assumeyes
flatpak install flathub org.gnome.Shotwell --assumeyes
flatpak install flathub com.spotify.Client --assumeyes
flatpak install flathub re.sonny.Tangram --assumeyes
flatpak install flathub com.github.liferooter.textpieces --assumeyes
flatpak install flathub org.freedesktop.Sdk.Extension.toolchain-aarch64 --assumeyes
flatpak install flathub com.github.hugolabe.Wike --assumeyes


flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.IntelliJ-IDEA-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.jetbrains.PyCharm-Community
flatpak override --env=FLATPAK_ENABLE_SDK_EXT="*" com.vscodium.codium

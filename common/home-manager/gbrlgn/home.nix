{ lib, pkgs, ... }:

let
  username = "gbrlgn";
  system = pkgs.stdenv.hostPlatform.system;
in

{
  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  home.sessionVariables =
    { EDITOR = "hx";
      TERMINAL = "blackbox";
    };

  home.packages = with pkgs;

    [ buf-language-server
      corefonts
      delve
      direnv
      distrobox
      ffmpeg
      glib
      glxinfo
      go
      gopls
      gnome.geary
      home-manager
      libportal
      libtool
      lldb
      lua5_4_compat
      lua54Packages.luarocks
      lua-language-server
      marksman
      nil
      nodePackages_latest.npm
      nodePackages_latest.vscode-json-languageserver
      nodePackages_latest.typescript-language-server
      nodePackages_latest.yaml-language-server
      pipenv
      python311Full
      python311Packages.pip
      python311Packages.pygit2
      python311Packages.python-lsp-server
      rustup
      starship
      taplo
      tectonic
      texlab
      xdg-dbus-proxy
      zlib
    ];

  programs =
    { home-manager.enable = true;

      fish =
        { enable = true;
          interactiveShellInit =
            builtins.readFile ../../xdg/config/fish/config.fish;
        };

      git =
        { enable = true;
          userName = "Gabriel Lemos";
          userEmail = "gabrielgian@protonmail.com";
          extraConfig =
            { credential.helper =
                "${pkgs.git.override { withLibsecret = true; }}/bin/git-credential-libsecret";
              core.editor = "hx";
            };
        };

      helix =
        { enable = true;
          defaultEditor = true;
        };
    };

  xdg.mime.enable = true;

  home.file =
    { "Modelos" =
        { source = ../../xdg/Modelos;
          recursive = true;
        };

      "Imagens/Wallpapers" =
        { source = ../../xdg/Wallpapers;
          recursive = true;
        };

      ".config/helix/config.toml".source =
        ../../helix/config.toml;
      ".config/helix/languages.toml".source =
        ../../helix/languages.toml;
      ".config/helix/runtime/themes/inconfidente.toml".source =
        ../../inconfidente/inconfidente-dark.toml;
      ".local/share/blackbox/schemes/inconfidente-tilix.json".source =
        ../../inconfidente/inconfidente-dark-tilix.json;
      ".local/share/applications/Ubuntu.desktop".source =
        ../../xdg/local/share/applications/Ubuntu.desktop;
      ".local/share/icons/distrobox".source = ../../xdg/icons/distrobox;
    };

  dconf.settings =
    { "org/gnome/desktop/background" =
        { picture-uri = "file:///home/gbrlgn/Imagens/Wallpapers/stoppages.jpg";
          picture-uri-dark = "file:///home/gbrlgn/Imagens/Wallpapers/members.jpg";
        };
    };

  gtk =

    let
      gtkconf =
        { gtk-application-prefer-dark-theme = 1;
          gtk-xft-antialias = 1;
          gtk-xft-hinting = 1;
          gtk-xft-hintstyle = "hintslight";
          gtk-xft-rgba = "rgb";
        };
    in

    {
      enable = true;

      theme =
        { name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };

      gtk4.extraConfig = gtkconf;
      gtk3.extraConfig = gtkconf;
      gtk2.extraConfig = ''
        gtk-application-prefer-dark-theme=1
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
}

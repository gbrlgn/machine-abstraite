{ pkgs, ... }:

let
  username = "gbrlgn";
  version = "24.11";
in

{ dconf.settings =
    { "org/gnome/desktop/background" =
        { picture-uri = "file:///home/gbrlgn/Imagens/Wallpapers/stoppages.jpg";
          picture-uri-dark = "file:///home/gbrlgn/Imagens/Wallpapers/members.jpg";
        };
    };

  fonts.fontconfig.enable = true;

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

    { enable = true;

      gtk2.extraConfig =
        ''
          gtk-application-prefer-dark-theme=1
          gtk-xft-antialias=1
          gtk-xft-hinting=1
          gtk-xft-hintstyle="hintslight"
          gtk-xft-rgba="rgb"
        '';
      gtk3.extraConfig = gtkconf;
      gtk4.extraConfig = gtkconf;

      theme =
        { name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };
    };

  home =
    { file =
        { "Modelos" =
            { source = ../../xdg/Modelos;
              recursive = true;
            };

          "Imagens/Wallpapers" =
            { source = ../../xdg/Wallpapers;
              recursive = true;
            };

          ".config/bat/config".source =
            ../../xdg/config/bat/config;
          ".config/fish/assume.fish".source =
            ../../xdg/config/fish/assume.fish;
          ".config/helix/config.toml".source =
            ../../helix/config.toml;
          ".config/helix/languages.toml".source =
            ../../helix/languages.toml;
          ".config/helix/runtime/themes/inconfidente-dark.toml".source =
            ../../inconfidente/inconfidente-dark.toml;
          ".local/share/blackbox/schemes/inconfidente-tilix.json".source =
            ../../inconfidente/inconfidente-dark-tilix.json;
          ".local/share/applications/Vaultwarden.desktop".source =
            ../../xdg/local/share/applications/Vaultwarden.desktop;
          ".local/share/icons/vaultwarden".source = ../../xdg/icons/vaultwarden;
        };

      homeDirectory = "/home/${username}";

      packages = with pkgs;

        [ buf
          corefonts
          delve
          direnv
          distrobox
          fd
          ffmpeg
          fzf
          geary
          glib
          glxinfo
          go
          gopls
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
          postgresql
          python312
          python312Packages.pip
          python312Packages.pygit2
          python312Packages.python-lsp-server
          redis
          rustup
          starship
          taplo
          texliveSmall
          xdg-dbus-proxy
          yt-dlp
          zlib
        ];

      sessionVariables =
        { EDITOR = "hx";
          TERMINAL = "ptyxis";
        };

      stateVersion = version;
      username = "${username}";
    };

  nixpkgs.config.allowUnfree = true;

  programs =
    { home-manager =
        { enable = true;
        };

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
}

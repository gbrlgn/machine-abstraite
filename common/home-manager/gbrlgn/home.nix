{ flakes, pkgs, lib, ... }:

let
  username = "gbrlgn";
  system = pkgs.stdenv.hostPlatform.system;
in

{
  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "23.05";

  home.sessionVariables =
    { EDITOR = "hx";
      TERMINAL = "blackbox";
    };

  home.packages = with pkgs;

    let
      helix = flakes.helix.packages.${system}.default;
      home-manager = flakes.home-manager.packages.${system}.default;
    in

    [ amberol
      buf-language-server
      cabal-install
      celluloid
      clojure
      clojure-lsp
      corefonts
      delve
      dhall
      direnv
      distrobox
      elixir
      elixir-ls
      ffmpeg
      fira-code
      fira-code-symbols
      fragments
      ghc
      gitui
      glib
      glxinfo
      go
      go-font
      gopls
      gnome.geary
      gnome.nautilus-python
      haskell-language-server
      helix
      home-manager
      ibm-plex
      jdk
      jdt-language-server
      leiningen
      libportal
      libreoffice-fresh
      libtool
      lldb
      lua5_4_compat
      lua54Packages.luarocks
      lua-language-server
      marksman
      nerdfonts
      nil
      nodePackages_latest.npm
      nodePackages_latest.vscode-json-languageserver
      nodePackages_latest.typescript-language-server
      nodePackages_latest.yaml-language-server
      onlyoffice-bin
      pipenv
      powerline-fonts
      powerline-symbols
      python311Full
      python311Packages.pip
      python311Packages.pygit2
      python311Packages.python-lsp-server
      rio
      rustup
      shotwell
      spotify
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
              core.editor = "flatpak run --file-forwarding re.sonny.Commit @@";
            };
        };

      helix =
        { enable = true;
          defaultEditor = true;
          package =  flakes.helix.packages.${system}.default;        
        };
    };

  services.emacs.enable = true;

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
      ".config/helix/runtime/themes/inconfidente.toml".source =
        ../../inconfidente/inconfidente.toml;
      ".local/share/blackbox/schemes/inconfidente-tilix.json".source =
        ../../inconfidente/inconfidente-tilix.json;
      ".local/share/applications/Ubuntu.desktop".source =
        ../../xdg/local/share/applications/Ubuntu.desktop;
      ".local/share/icons/distrobox".source = ../../xdg/icons/distrobox;
    };

  dconf.settings =
    { "org/gnome/desktop/interface" =
        { color-scheme = "prefer-dark";
        };

      "org/gnome/desktop/background" =
        { picture-uri = "file:///home/gbrlgn/Imagens/Wallpapers/stoppages.jpg";
          picture-uri-dark = "file:///home/gbrlgn/Imagens/Wallpapers/takeyourtime.jpg";
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

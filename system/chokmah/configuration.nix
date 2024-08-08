{ flakes, lib, pkgs, ... }:

let
  imports = [ ./hardware-configuration.nix ];
  system = "x86_64-linux";
  version = "24.05";
in

{ boot =
    { kernelPackages = pkgs.linuxPackages_latest;

      loader =
        { grub =
            { enable = true;
              devices = [ "nodev" ];
              useOSProber = true;
              efiSupport = true;
            };

            efi =
              { canTouchEfiVariables = true;
                efiSysMountPoint = "/boot/efi";
              };
        };
    };

  documentation.nixos.enable = false;

  environment =
    { gnome.excludePackages = with pkgs;
        [ cheese
          eog
          gnome.gnome-clocks
          gnome.gnome-contacts
          gnome.gnome-music
          gnome.gnome-weather
          gnome-connections
          gnome-keyring
          gnome-photos
          gnome-tour
          gnome-user-docs
          gnome-system-monitor
          seahorse
          totem
          yelp
          yelp-xsl
          epiphany
          kgx
        ];

      shells = with pkgs; [ bashInteractive fish ];

      systemPackages = with pkgs;

        let
          eza = flakes.eza.packages.${system}.default;
        in

        [ aspellDicts.pt_BR
          awscli
          bat
          bash
          bc
          (lib.lowPrio binutils)
          blackbox-terminal
          bottom
          cmake
          coreutils
          cri-tools
          curl
          dbus
          dig
          docker
          docker-compose
          drawio
          efm-langserver
          eza
          fd
          flatpak
          firefox-wayland
          firmwareLinuxNonfree
          fish
          (lib.hiPrio gcc)
          git
          gitui
          glibc
          gnumake
          gnome.adwaita-icon-theme
          gnome.gdm
          gnome.gnome-logs
          gnome-tweaks
          gum
          helix
          inetutils
          jq
          kubectl
          kubernetes-helm
          less
          mesa
          netcat
          nettools
          node
          ntfs3g
          openssl
          orjail
          p7zip
          pciutils
          pkg-config
          pipewire
          pstree
          pulumi
          ripgrep
          slack
          socat
          terraform
          terraform-ls
          terraform-providers.aws
          terraform-providers.helm
          terraform-providers.kubernetes
          tmux
          tree
          unzip
          usbutils
          util-linux
          websocat
          wget
          wireplumber
          wl-clipboard-x11
          yq
        ];

      variables =
        { __GL_MaxFramesAllowed = "0";
          __GL_LOG_MAX_ANISO = "4";
          MOZ_ENABLE_WAYLAND = "1";
          EDITOR = "hx";
        };
    };

  fonts =
    { fontDir.enable = true;

      packages = with pkgs;
        [ corefonts
          texlivePackages.fontawesome5
          fira-code
          fira-code-symbols
          go-font
          ibm-plex
          nerdfonts
          powerline-fonts
          powerline-symbols
        ];
    };

  hardware =
    { graphics =
        { enable = true;

          extraPackages = with pkgs;
            [ vaapiVdpau
              libvdpau-va-gl
            ];
        };

      pulseaudio.enable = false;
    };

  i18n.defaultLocale = "pt_BR.UTF-8";
  imports = imports;

  networking =
    { firewall.enable = true;
      hostName = "chokmah";
      networkmanager.enable = true;
    };

  nix =
    { gc =
        { automatic = true;
          dates = "daily";
          options = "--delete-older-than 15d";
        };

      optimise.automatic = true;

      settings =
        { allowed-users = [ "@wheel" ];
          auto-optimise-store = true;
          experimental-features = [ "nix-command" "flakes" ];
        };
    };

  nixpkgs.config.allowUnfree = true;

  programs =
    { dconf.enable = true;
      ssh.askPassword = "";
      fish.enable = true;
    };

  security =
    { rtkit.enable = true;
      sudo.execWheelOnly = true;
    };

  services =
    { dbus.enable = true;
      flatpak.enable = true;
      gnome.gnome-keyring.enable = true;
      gnome.gnome-online-accounts.enable = true;
      gnome.tracker.enable = true;
      gnome.tracker-miners.enable = true;
      libinput.enable = true;

      pipewire =
        { enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
        };

      printing.enable = false;

      xserver =
        { desktopManager.gnome.enable = true;
          displayManager.gdm.enable = true;
          displayManager.gdm.wayland = true;
          desktopManager.xterm.enable = false;
          enable = true;
          excludePackages = [ pkgs.xterm ];
          videoDrivers = [ "intel" ];
          xkb = {
            layout = "us";
          };
        };
    };

  system.stateVersion = version;

  systemd =
    { services.NetworkManager-wait-online.enable = false;
      network.wait-online.anyInterface = true;
    };

  time.timeZone = "America/Sao_Paulo";

  users.users.gbrlgn =
    { home = "/home/gbrlgn";
      extraGroups = [ "docker" "flatpak" "networkmanager" "video" "wheel" ];
      initialPassword = "assemblage";
      isNormalUser = true;
      name = "gbrlgn";
      shell = pkgs.fish;
    };

  virtualisation =
    { containerd.enable = true;
      docker.enable = true;
    };

  xdg.portal =
    { enable = true;
      wlr.enable = true;
    };
}

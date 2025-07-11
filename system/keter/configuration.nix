{ config, lib, pkgs, ... }:

let
  imports = [ ./hardware-configuration.nix ];
  version = "24.05";
in

{ boot =
    { extraModulePackages =
        [ config.boot.kernelPackages.nvidia_x11 ];
      
      kernelModules = [ "nvidia" ];
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [ "nvidia_drm.fbdev=1" ];

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
          gnome-clocks
          gnome-connections
          gnome-contacts
          gnome-keyring
          gnome-music
          gnome-photos
          gnome-system-monitor
          gnome-tour
          gnome-user-docs
          gnome-weather
          seahorse
          totem
          yelp
          yelp-xsl
          epiphany
          kgx
        ];

      localBinInPath = true;
      shells = with pkgs; [ bashInteractive fish ];

      systemPackages = with pkgs;
        [ adwaita-icon-theme
          aspellDicts.pt_BR
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
          efm-langserver
          eza
          firefox-wayland
          firmwareLinuxNonfree
          fish
          flatpak
          (lib.hiPrio gcc)
          gdm
          git
          gitui
          glibc
          gnumake
          gnome-logs
          gnome-tweaks
          helix
          inetutils
          jq
          kdash
          kubectl
          kubernetes-helm
          less
          mesa
          nerdctl
          netcat
          nettools
          ntfs3g
          openssl
          orjail
          p7zip
          pciutils
          pkg-config
          pipewire
          pstree
          ripgrep
          socat
          tmux
          tree
          unzip
          usbutils
          util-linux
          websocat
          wget
          wireplumber
          wl-clipboard-x11
          yq-go
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
          nerd-fonts.fira-code
          nerd-fonts.fira-mono
          nerd-fonts.go-mono
          nerd-fonts.symbols-only
          powerline-fonts
          powerline-symbols
        ];
    };

  hardware =
    { nvidia =
        { modesetting.enable = true;
          nvidiaSettings = true;
          # package = config.boot.kernelPackages.nvidiaPackages.production;
          powerManagement.enable = true;

          prime =
            { intelBusId = "PCI:0:2:0";
              nvidiaBusId = "PCI:1:0:0";
              offload =
                { enable = true;
                  enableOffloadCmd = true;
                };
            };
        };

      graphics =
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
      hostName = "keter";
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
      fish.enable = true;
      nix-ld.enable = true;
      ssh.askPassword = "";
    };

  security =
    { pki.certificateFiles =
        [ ../../common/ssl/vaultwarden.crt
        ];

      rtkit.enable = true;
      sudo.execWheelOnly = true;
    };

  services =
    { dbus.enable = true;
      desktopManager.cosmic.enable = true;
      displayManager.cosmic-greeter.enable = true;
      flatpak.enable = true;
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
          desktopManager.xterm.enable = false;
          displayManager.gdm.enable = true;
          displayManager.gdm.wayland = true;
          enable = true;
          excludePackages = [ pkgs.xterm ];
          videoDrivers = [ "nvidia" ];
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

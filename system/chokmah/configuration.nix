{ lib, pkgs, ... }:

let
  imports = [ ./hardware-configuration.nix ];
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
          gnome-clocks
          gnome-contacts
          gnome-connections
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
          awscli2
          aws-sam-cli
          azure-cli
          bat
          bash
          bc
          (lib.lowPrio binutils)
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
          firefox-wayland
          firmwareLinuxNonfree
          fish
          flatpak
          fnm
          (lib.hiPrio gcc)
          gdm
          git
          gitui
          glibc
          gnumake
          gnome-logs
          gnome-tweaks
          granted
          grpcurl
          gum
          helix
          inetutils
          jq
          kubectl
          kubelogin
          kubernetes-helm
          less
          mesa
          netcat
          nettools
          nmap
          nodejs
          ntfs3g
          openssl
          openvpn
          p7zip
          pandoc
          pciutils
          pdm
          pkg-config
          pipewire
          pritunl-client
          pstree
          ptyxis
          python312Packages.boto3
          python312Packages.grpclib
          python312Packages.regex
          python312Packages.virtualenv
          ripgrep
          serverless
          slack
          socat
          tcpdump
          terraform
          terraform-docs
          terraform-ls
          terraform-providers.aws
          terraform-providers.helm
          terraform-providers.kubernetes
          terragrunt
          tmux
          tree
          unzip
          usbutils
          util-linux
          websocat
          wget
          wireplumber
          wl-clipboard-x11
          yarn
          yq-go
          zip
        ];

      variables =
        { __GL_MaxFramesAllowed = "0";
          __GL_LOG_MAX_ANISO = "4";
          EDITOR = "hx";
          MOZ_ENABLE_WAYLAND = "1";
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
          nerd-fonts.go-mono
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
      desktopManager.gnome.enable = true;

      displayManager =
        { gdm =
          { enable = true;
            wayland = true;
          };
        };

      flatpak.enable = true;
      gnome.gnome-keyring.enable = true;
      gnome.gnome-online-accounts.enable = true;
      gnome.tinysparql.enable = true;
      gnome.localsearch.enable = true;
      libinput.enable = true;

      pipewire =
        { enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
        };

      printing.enable = false;
      pulseaudio.enable = false;

      xserver =
        { desktopManager.xterm.enable = false;
          enable = true;
          excludePackages = [ pkgs.xterm ];
          videoDrivers = [ "modesetting" ];
          xkb = {
            layout = "us";
          };
        };
    };

  system.stateVersion = version;

  systemd =
    { packages = [ pkgs.pritunl-client ];
      services.NetworkManager-wait-online.enable = false;
      targets = {
        multi-user.wants = [ "pritunl-client.service" ];
      };
      network.wait-online.anyInterface = true;
    };

  time.timeZone = "America/Sao_Paulo";

  users =
   { users.gbrlgn =
      { home = "/home/gbrlgn";
        extraGroups = [ "docker" "flatpak" "networkmanager" "video" "wheel" ];
        initialPassword = "assemblage";
        isNormalUser = true;
        name = "gbrlgn";
        shell = pkgs.fish;
      };

    extraGroups.vboxusers.members = [ "gbrlgn" ];
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

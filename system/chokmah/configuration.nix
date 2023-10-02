{ flakes, config, pkgs, lib, ... }:

let
  system = "x86_64-linux";
in

{
  imports = [ ./hardware-configuration.nix ];

  boot =
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

  systemd.services.NetworkManager-wait-online.enable = false;
  systemd.network.wait-online.anyInterface = true;

  documentation.nixos.enable = false;

  fonts.fontDir.enable = true;

  fonts.packages = with pkgs;
    [ corefonts
      emacsPackages.fontawesome
      fira-code
      fira-code-symbols
      go-font
      ibm-plex
      nerdfonts
      powerline-fonts
      powerline-symbols
    ];

  i18n.defaultLocale = "pt_BR.UTF-8";
  time.timeZone = "America/Sao_Paulo";

  networking =
    { firewall.enable = true;
      hostName = "chokmah";
      networkmanager.enable = true;
    };

  hardware.opengl =
    { driSupport = true;
      driSupport32Bit = true;
      enable = true;

      extraPackages = with pkgs;
        [ vaapiVdpau
          libvdpau-va-gl
        ];
    };

  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  security.sudo.execWheelOnly = true;

  services.dbus.enable = true;
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.tracker.enable = true;
  services.gnome.tracker-miners.enable = true;

  services.pipewire =
    { enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

  services.printing.enable = false;

  services.xserver =
    { desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      desktopManager.xterm.enable = false;
      enable = true;
      excludePackages = [ pkgs.xterm ];
      layout = "us";
      libinput.enable = true;
      videoDrivers = [ "intel" ];
    };

  virtualisation.containerd.enable = true;
  virtualisation.docker.enable = true;

  users.users.gbrlgn =
    { home = "/home/gbrlgn";
      extraGroups = [ "docker" "flatpak" "networkmanager" "video" "wheel" ];
      initialPassword = "assemblage";
      isNormalUser = true;
      name = "gbrlgn";
      shell = pkgs.fish;
    };

  nixpkgs.config.allowUnfree = true;

  nix.gc =
    { automatic = true;
      dates = "daily";
      options = "--delete-older-than 15d";
    };

  nix.optimise.automatic = true;

  nix.settings =
    { allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

  xdg.portal =
    { enable = true;
      wlr.enable = true;
    };

  programs.dconf.enable = true;
  programs.ssh.askPassword = "";
  programs.fish.enable = true;

  environment.gnome.excludePackages = with pkgs;
    [ gnome.gnome-clocks
      gnome.gnome-contacts
      gnome.gnome-keyring
      gnome.gnome-music
      gnome.gnome-system-monitor
      gnome.gnome-weather
      gnome.cheese
      gnome.eog
      gnome.seahorse
      gnome.totem
      gnome.yelp
      gnome.yelp-xsl
      gnome-connections
      gnome-photos
      gnome-tour
      gnome-user-docs
      epiphany
      kgx
    ];

  environment.shells = with pkgs; [ bashInteractive fish ];

  environment.variables =
    { __GL_MaxFramesAllowed = "0";
      __GL_LOG_MAX_ANISO = "4";
      MOZ_ENABLE_WAYLAND = "1";
      EDITOR = "emacs";
    };

  environment.systemPackages = with pkgs;

    let
      eza = flakes.eza.packages.${system}.default;
    in

    [ aspellDicts.pt_BR
      awscli
      bat
      bc
      (lib.lowPrio binutils)
      blackbox-terminal
      bottom
      cmake
      containerd
      coreutils
      curl
      dbus
      dig
      docker
      docker-compose
      drawio
      eza
      fd
      flatpak
      firefox-wayland
      firmwareLinuxNonfree
      fish
      (lib.hiPrio gcc)
      git
      glibc
      gnumake
      gnome.adwaita-icon-theme
      gnome.gdm
      gnome.gnome-tweaks
      gnome.gnome-logs
      inetutils
      infracost
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
      openlens
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
      tor
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

  system.stateVersion = "23.05";
}

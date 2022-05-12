{ config, pkgs, lib, ... }:

let

  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
  
in

{
  imports =
    [
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];


###############################################################################

  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ 
    "acpi_rev_override" "mem_sleep_default=deep"
    "intel_iommu=igfx_off" "nvidia-drm.modeset=1" 
  ];
  boot.loader = {
    grub = { 
      enable = true;
      devices = [ "nodev" ];
      useOSProber = true;
      efiSupport = true;
      version = 2;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };


###############################################################################


  i18n.defaultLocale = "pt_BR.UTF-8";
  time.timeZone = "America/Sao_Paulo";


###############################################################################


  networking = {
    hostName = "syzygy";
    interfaces.enp59s0.useDHCP = true;
    interfaces.wlp60s0.useDHCP = true;
    networkmanager.enable = true;
  };


###############################################################################


  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      sync.allowExternalGpu = true;
    };
  };
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


###############################################################################


  services.flatpak.enable = true;
  services.snap.enable = true;
  services.xserver = {
    desktopManager.xterm.enable = false;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.nvidiaWayland = true;
    displayManager.gdm.wayland = true;
    enable = true;
    layout = "us";
    libinput.enable = true;
    videoDrivers = [ "nvidia" ];
  };
  services.printing.enable = true;


###############################################################################


  users.users.gbrlgn = {
    name = "gbrlgn";
    isNormalUser = true;
    home = "/home/gbrlgn";
    extraGroups = [ "networkmanager" "video" "wheel" ];
    initialPassword = "assemblage";
    shell = pkgs.fish;
  };


###############################################################################


  nixpkgs.config.allowUnfree = true;


###############################################################################


  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.ssh.askPassword = "";


###############################################################################


  environment.gnome.excludePackages = with pkgs;
    [
      epiphany gnome.gnome-system-monitor gnome.gnome-contacts
      gnome.gnome-weather gnome.gnome-keyring gnome.gnome-photos
      gnome.gnome-clocks gnome.cheese gnome.eog gnome.seahorse
      gnome.totem gnome.yelp gnome.yelp-xsl gnome-connections
      gnome-user-docs gnome-tour
    ];

  environment.shells = with pkgs; [ bashInteractive fish ];
  environment.systemPackages = with pkgs;
    [
      aspellDicts.pt_BR
      binutils
      celluloid coreutils curl
      dbus
      emacs exa
      ffmpeg firefox firmwareLinuxNonfree fish
      font-awesome
      gcc git glib
      gnome.gnome-tweaks go-font
      htop
      imagemagick
      less
      mesa 
      nerdfonts ntfs3g nvidia-offload
      p7zip pciutils pciutils
      powerline-fonts powerline-symbols pstree
      unzip util-linux
      vulkan-headers vulkan-tools
      wget
      zlib
    ];


###############################################################################


  home-manager.users.gbrlgn = {
    programs = {
      home-manager.enable = true;
      git = {
        enable = true;
        userName  = "Gabriel Gian";
        userEmail = "gabrielgian@protonmail.com";
        extraConfig = {
          credential.helper = "${
            pkgs.git.override { withLibsecret = true; }
          }/bin/git-credential-libsecret";
          core.editor = "flatpak run --file-forwarding re.sonny.Commit @@";
        };
      };
    };
  };


###############################################################################


  system.stateVersion = "21.11";


###############################################################################
}

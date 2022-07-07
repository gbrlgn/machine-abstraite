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

  boot = {
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ 
      "acpi_rev_override" "mem_sleep_default=deep"
      "nvidia-drm.modeset=1" "nvidia.NVreg_CheckPCIConfigSpace=0"
      "nvidia.NVreg_UsePageAttributeTable=1"
    ];
    loader = {
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
  };


###############################################################################


  fonts.fonts = with pkgs; 
    [
      corefonts    
      fira-code
      fira-code-symbols
      go-font
      ibm-plex
      nerdfonts
      powerline-fonts
      powerline-symbols
      rPackages.fontawesome
    ];
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
    nvidiaPersistenced = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    prime = {
      offload.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
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
  services.xserver = {
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.xterm.enable = false;
    enable = true;
    layout = "us";
    libinput.enable = true;
    useGlamor = true;
    videoDrivers = [ "nvidia" ];
  };
  services.printing.enable = true;
  
  virtualisation.docker.enable = true;


###############################################################################


  users.users.gbrlgn = {
    name = "gbrlgn";
    isNormalUser = true;
    home = "/home/gbrlgn";
    extraGroups = [ "networkmanager" "video" "wheel" "docker" ];
    initialPassword = "assemblage";
    shell = pkgs.fish;
  };


###############################################################################


  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (import 
      (builtins.fetchTarball https://github.com/nix-community/emacs-overlay/archive/master.tar.gz))
  ];
  nix.gc.automatic = true;
  xdg.portal.enable = true;


###############################################################################


  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.ssh.askPassword = "";


###############################################################################


  environment.gnome.excludePackages = with pkgs;
    [
      epiphany gnome.gnome-clocks gnome.gnome-contacts gnome.gnome-keyring
      gnome.gnome-music gnome.gnome-system-monitor gnome.gnome-weather  
      gnome.cheese gnome.eog gnome.geary gnome.seahorse gnome.totem gnome.yelp 
      gnome.yelp-xsl gnome-connections gnome-user-docs gnome-photos gnome-tour 
      kgx
    ];

  environment.shells = with pkgs; [ bashInteractive fish ];
  environment.systemPackages = with pkgs;
    [
      aspellDicts.pt_BR
      aws
      binutils bc
      celluloid clang clojure containerd coreutils
      cudatoolkit curl
      dbus direnv distrobox docker docker-client docker-compose dpkg
      elixir emacsNativeComp exa
      fd ffmpeg firefox firmwareLinuxNonfree fish
      gcc ghc git glib glxinfo gnumake go gnome.gnome-tweaks
      htop
      jdk jetbrains.idea-community jetbrains.pycharm-community
      kotlin kubectl kubernetes kubernetes-helm
      leiningen less
      mesa 
      nerdfonts nerdctl nodePackages.npm ntfs3g nvidia-offload
      orjail
      p7zip pciutils pipenv pstree pythonFull python39Packages.pip
      ripgrep rustc
      terraform terraform-providers.aws terraform-providers.kubernetes
      texlive.combined.scheme-full tor
      unzip util-linux
      vdpauinfo vscodium vulkan-headers vulkan-tools
      wget
      zlib
    ];
  
  environment.variables = {
    __GL_MaxFramesAllowed = "0";
    __GL_LOG_MAX_ANISO = "4";
  };


###############################################################################


  home-manager.users.gbrlgn = {
    home.stateVersion = "22.05";
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


  system.stateVersion = "22.05";


###############################################################################
}

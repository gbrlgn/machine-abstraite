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


  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };
  boot.supportedFilesystems = [ "ntfs" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.nvidia_x11 ];
  boot.kernelPackages = [ pkgs.linuxPackages_latest ];
  boot.blacklistedKernelModules = [ "nouveau" ];


###############################################################################


  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.consoleFont = "latarcyrheb-sun32";
  time.timeZone = "America/Sao_Paulo";


###############################################################################


  networking = {
    hostName = "danger";
    interfaces.enp59s0.useDHCP = true;
    interfaces.wlp60s0.useDHCP = true;
    networkmanager.enable = true;
  };


###############################################################################


  hardware.nvidia = {
    nvidiaPersistenced = true;
    modesetting.enable = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload.enable = true;
    };
  };
  hardware.opengl.driSupport32Bit = true;
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];
      hardware.nvidia.prime.offload.enable = lib.mkForce false;
      hardware.nvidia.powerManagement.enable = lib.mkForce false;
    };
  };


###############################################################################


  services.flatpak.enable = true;
  services.xserver = {
    autorun = true;
    desktopManager.xterm.enable = false;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.nvidiaWayland = true;
    displayManager.gdm.wayland = true;
    enable = true;
    layout = "us";
    libinput.enable = true;
    videoDrivers = [ "nvidia" "modesetting" ];
  };
  # services.printing.enable = true;


###############################################################################


  users.users.dancer = {
    name = "dancer";
    isNormalUser = true;
    home = "/home/dancer";
    extraGroups = [ "wheel" "networkmanager" "video"];
    initialPassword = "assemblage";
    shell = pkgs.zsh;
  };


###############################################################################


  nixpkgs.config.allowUnfree = true;


###############################################################################


  programs.dconf.enable = true;
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

  environment.shells = with pkgs; [ bashInteractive zsh ];
  environment.systemPackages = with pkgs;
    [
      aspellDicts.pt_BR
      binutils
      cargo celluloid clisp clojure coreutils curl
      dbus docker
      elixir emacs
      ffmpeg firefox firmwareLinuxNonfree flatpak
      fractal fragments font-awesome
      gaphor gcc ghc git gimp glib
      gnome-podcasts gnome.geary gnome.gnome-tweaks go go-tools
      htop
      imagemagick inkscape
      jdk jetbrains.idea-community jetbrains.pycharm-community
      kubernetes
      leiningen less libreoffice lua
      metadata-cleaner mitscheme
      newsflash nodePackages.npm ntfs3g nvidia-offload linuxPackages.nvidia_x11
      pciutils python39Packages.pip pciutils pipenv python p7zip
      postgresql powerline-fonts powerline-symbols pure-prompt
      redis rustc
      shotwell spotify steam
      tangram
      unzip unrar util-linux
      vscodium wget wike
      zlib zsh
    ];


###############################################################################


  home-manager.users.dancer = {
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

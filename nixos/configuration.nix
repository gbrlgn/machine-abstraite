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


###############################################################################
 

  i18n.defaultLocale = "pt_BR.UTF-8";
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
    modesetting.enable = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload.enable = true;
    };
  };
  hardware.pulseaudio.enable = false;
  # sound.enable = true;
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
    desktopManager.gnome.enable = true;
    desktopManager.xterm.enable = false;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    enable = true;
    layout = "us";
    libinput.enable = true;
    videoDrivers = [ "nvidia" ];
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
      aspellDicts.pt_BR binutils cargo coreutils curl clisp
      clojure dbus docker elixir emacs ffmpeg firefox
      firmwareLinuxNonfree flatpak font-awesome gcc ghc git
      glib gnome.gnome-tweaks go go-tools htop imagemagick
      jdk kubernetes leiningen lua mitscheme nodePackages.npm
      ntfs3g nvidia-offload pciutils python39Packages.pip
      pipenv python p7zip postgresql powerline-fonts
      powerline-symbols pure-prompt redis rustc tangram
      unzip unrar util-linux wget zlib zsh
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

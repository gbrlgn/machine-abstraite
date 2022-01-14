{ config, pkgs, ... }: 

let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
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
    powerManagement.enable = true;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload.enable = true;
    };
    modesetting.enable = true;
  };
  # hardware.pulseaudio.enable = true;
  # sound.enable = true;
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
      autorun = true;
      desktopManager.gnome.enable = true;
      desktopManager.xterm.enable = false;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = true;
      enable = true;
      layout = "us";
      libinput.enable = true;
      videoDrivers = [ "modesetting" "nvidia" ];
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
  programs.ssh.askPassword = "assemblage";


###############################################################################

  
  environment.gnome.excludePackages = with pkgs; 
    [ 
      gnome.gnome-system-monitor        	gnome.gnome-contacts
      gnome.gnome-weather               	gnome.gnome-keyring
      gnome.gnome-photos                	gnome.gnome-clocks
      gnome.cheese                          gnome.eog
      gnome.seahorse                        gnome.totem
      gnome.yelp                            gnome.yelp-xsl
      gnome-connections                     gnome-user-docs                   gnome-tour
    ];
  
  environment.systemPackages = with pkgs; 
    [
      aspellDicts.pt_BR                     binutils
      cargo                                 coreutils
      curl                              	clisp
      clojure                               dbus
      docker                                elixir
      emacs                                 ffmpeg
      firefox                               firmwareLinuxNonfree
      flatpak                               gcc
      ghc                                   git
      glib                                  gnome.gnome-tweaks
      gnumake                               go
      go-tools                              htop
      imagemagick                           jdk
      kubernetes                            leiningen
      linuxPackages.nvidia_x11              lua
      mitscheme                             nerdfonts
      nodePackages.npm                      ntfs3g
      pciutils                              python39Packages.pip
      pipenv                                python
      p7zip                                 postgresql
      powerline-fonts                       powerline-symbols
      pure-prompt                           redis
      rustc                                 tangram
      unzip                                 unrar
      util-linux                            wget
      zlib                                  zsh
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

        zsh = {
          enable = true;
          profileExtra = ''
            export ZSH="/home/dancer/.oh-my-zsh"

            ZSH_THEME=""
            plugins=(
                zsh-autosuggestions
                zsh-completions
                zsh-syntax-highlighting
            )
            
            fpath+=$HOME/.zsh/pure
            autoload -U promptinit; promptinit
            prompt pure
            zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
            zstyle :prompt:pure:prompt:error color red
            zstyle :prompt:pure:prompt:success color green
            zstyle :prompt:pure:prompt:continuation color blue
            zstyle :prompt:pure:git:dirty color purple
            zstyle :prompt:pure:git:arrow color blue
            zstyle :prompt:pure:git:stash color gray
            zstyle :prompt:pure:git:branch color cyan
            zstyle :prompt:pure:git:branch:cached color red
            zstyle :prompt:pure:execution_time color yellow
          '';
        };
      };
    };


###############################################################################


  system.stateVersion = "21.11";


###############################################################################
}

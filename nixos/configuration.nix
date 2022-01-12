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
    hostName = "00000";
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
  hardware.pulseaudio.enable = true;
  sound.enable = true;


###############################################################################


  services.flatpak.enable = true;
  services.xserver = {
      autorun = true;
      desktopManager.gnome.enable = true;
      desktopManager.xterm.enable = false;
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = false;
      enable = true;
      layout = "us";
      libinput.enable = true;
      videoDrivers = [ "modesetting" "nvidia" ];
  };
  # services.printing.enable = true;


###############################################################################
  

  users.users.calabar = {
    name = "calabar";
    isNormalUser = true;
    home = "/home/calabar";
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
      gnome.gnome-system-monitor        	gnome.gnome-contacts
      gnome.gnome-weather               	gnome.gnome-keyring
      gnome.gnome-photos                	gnome.gnome-clocks
      gnome.yelp-xsl                    	gnome.seahorse
      gnome.cheese                      	gnome.yelp
      gnome.eog                         	gnome-connections
      gnome-user-docs                   	gnome-tour
    ];
  
  environment.systemPackages = with pkgs; 
    [
      aspellDicts.pt_BR                 	binutils
      cargo                             	coreutils
      curl                              	clisp
      clojure                           	dbus
      elixir                            	emacs
      epiphany                          	ffmpeg 
      firefox                           	firmwareLinuxNonfree
      flatpak                           	gcc
      ghc                               	gimp
      git                               	glib
      gnome.gnome-tweaks                	gnumake
      go                                	go-tools
      htop                              	ibm-plex
      imagemagick                       	inkscape
      jdk                               	keepassxc
      libreoffice                       	liferea
      linuxPackages.nvidia_x11          	nerdfonts
      nodePackages.npm                  	ntfs3g
      pciutils                          	php80
      php80Packages.composer            	python
      p7zip                             	rustc
      steam                             	powerline-fonts
      powerline-symbols                 	pure-prompt
      unzip                             	unrar
      util-linux                        	vscodium
      wget                              	zlib 
      zsh
      (
        with import <nixpkgs> {};

        vim_configurable.customize {
          name = "vim";
          vimrcConfig = {
            customRC = ''
              set number 
              syntax on

              map <C-n> :NERDTreeToggle<CR>
              let g:airline_powerline_fonts = 1 
              let g:tex_flavor = 'tex'

              set tabstop=4
              set shiftwidth=4
              set expandtab
              setlocal spell spelllang=br
            '';

            vam = {
              knownPlugins = pkgs.vimPlugins;
              pluginDictionaries = [
                { names = 
                  [
                    "ale"			"nerdtree"
                    "vimtex"			"vim-airline"
                    "vim-airline-themes"	"vim-devicons"
                    "YouCompleteMe"
                  ];
                }
              ];
            };
          };
        }
      )
    ];


###############################################################################


    home-manager.users.calabar = {
      programs = {
        git = {
          enable = true;
          userName  = "Gabriel Gian";
          userEmail = "gabrielgian@protonmail.com";
          extraConfig = {
            credential.helper = "${
              pkgs.git.override { withLibsecret = true; }
            }/bin/git-credential-libsecret";
          };
        };

        home-manager.enable = true;

        zsh = {
          enable = true;
          profileExtra = ''
            export ZSH="/home/calabar/.oh-my-zsh"

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


  system.stateVersion = "21.05";


###############################################################################
}

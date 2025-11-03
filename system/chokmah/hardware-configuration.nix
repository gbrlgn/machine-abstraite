{ config, lib, modulesPath, ... }:

{ boot.initrd.availableKernelModules = 
    [ "xhci_pci" 
      "ahci"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "sdhci_pci"
    ];

  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  hardware.cpu.intel.updateMicrocode = 
    lib.mkDefault config.hardware.enableRedistributableFirmware;
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems =

    let
      btrfsCommonOpts =
        [ "defaults"
          "compress=zstd"
          "noatime"
          "nodiscard"
        ];
    in

    { "/" =
        { label = "nixos";
          fsType = "btrfs";
          options = [ "subvol=root" ] ++ btrfsCommonOpts;
        };

      "/home" =
        { label = "nixos";
          fsType = "btrfs";
          options = [ "subvol=home" ] ++ btrfsCommonOpts;
        };

      "/nix" =
        { label = "nixos";
          fsType = "btrfs";
          options = [ "subvol=nix" ] ++ btrfsCommonOpts;
        };

      "/swap" =
        { label = "nixos";
          fsType = "btrfs";
          options = [ "subvol=swap" ] ++ btrfsCommonOpts;
        };

      "/boot/efi" =
        { label = "boot";
          fsType = "vfat";
        };
    };

  networking =
    { useDHCP = lib.mkDefault true;
      # interfaces.enp59s0.useDHCP = lib.mkDefault true;
      # interfaces.wlp60s0.useDHCP = lib.mkDefault true;
    };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  services =
    { btrfs.autoScrub =
        { enable = true;
          interval = "weekly";
        };
    };

  swapDevices =
    [ { device = "/swap/swapfile"; } ];

}

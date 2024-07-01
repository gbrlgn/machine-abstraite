{ config, lib, modulesPath, pkgs, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = 
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

  swapDevices =
    [ { device = "/swap/swapfile"; } ];

  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.interval = "weekly";

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixupkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}

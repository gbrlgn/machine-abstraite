(use-modules (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules desktop xorg)
(use-package-modules (certs gnome)))

(operating-system
    (kernel linux)
    (initrd microcode-initrd)
    (firmware (list linux-firmware))
    (host-name "00000")
    (timezone "America/Sao_Paulo")
    (locale "pt_BR.utf8")
    
    (keyboard-layout (keyboard-layout "us"))

    (bootloader (bootloader-configuration
                    (bootloader grub-efi-bootloader)
                    (target "/boot/efi")
                    (keyboard-layout keyboard-layout)))

    (mapped-devices
        (list (mapped-device
                (source (device "/dev/sda2"))
                (target "root")
                (type luks-device-mapping))
              (mapped-device
                (source (device "/dev/sda1"))
                (target "boot")
                (type "vfat"))
              (mapped-device
                (source (device "/dev/sda3"))
                (target "swap")
                (type "vfat"))))
                
    (file-systems (append
                    (list (file-system
                            (device (file-system-label "root"))
                            (mount-point "/")
                            (type "ext4")
                            (dependencies mapped-devices))
                        (file-system
                            (device (file-system-label "boot"))
                            (mount-point "/boot/efi")
                            (type "vfat")))
                    %base-file-systems))

    (users (cons (user-account
                    (name "calabar")
                    (comment "we await silent tritero's empire")
                    (password (crypt "calabar" "$6$abc"))
                    (group "users")
                    (supplementary-groups '("wheel" "netdev" "audio" "video")))
                    
                  %base-user-accounts))

    (packages (append (list
                        nss-certs
                        gvfs
                        coreutils
                        pciutils
                        gimp
                        inkscape
                        epiphany)
                      %base-packages))

    (services (append (list (service gnome-desktop-service-type)
                            (set-xorg-configuration
                                (xorg-configuration
                                    (keyboard-layout keyboard-layout))))
                        %desktop-services))

    (name-service-switch %mdns-host-lookup-nss))
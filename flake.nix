{ description = ''
    En un premier sens, il n'y a pas la machine abstraite, ni
    de machines abstraites qui seraient comme des Idées plato-
    niciennes, transcendantes et universelles, éternelles. Les
    machines abstraites operent dans les agencements concrets :
    elles se définissent par le quatrieme aspect des agencements,
    c'est-a-dire par les pointes de décodage et de déterritoria-
    lisation. Elles tracent ces pointes ; aussi ouvrent-elles l'agen-
    cement territorial sur autre chose, sur des agencements d'un
    autre type, sur le moléculaire, sur le cosmique, et consti-
    tuent des devenirs. Elles sont donc toujours singulieres et
    immanentes. Contrairement a ce qui se passe dans les
    strates, et aussi dans les agencements considérés sous leurs
    autres aspects, les machines abstraites ignorent les formes et
    les substances. Ce en quoi elles sont abstraites, mais c'est
    aussi le sens rigoureux du concept de machine. Elles exce-
    dent toute mécanique. Elles s'opposent a l'abstrait dans son
    sens ordinaire. Les machines abstraites consistent en matie-
    res non formées et en fonctions non formelles. Chaque
    machine abstraite est un ensemble consolidé de matieres-
    fonctions (phylum et diagramme).
  '';

  inputs =
    { nixpkgs.url = "nixpkgs/nixos-unstable";

      home-manager =
        { url = "home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
        };

      nixos-cosmic =
        { url = "github:lilyinstarlight/nixos-cosmic";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

  outputs = inputs:

  let
    username = "gbrlgn";
  in

  { nixosConfigurations = with inputs;
      { keter = nixpkgs.lib.nixosSystem
          { modules =
              [ ./system/keter/configuration.nix
                home-manager.nixosModules.home-manager
                nixos-cosmic.nixosModules.default
                { home-manager.useGlobalPkgs = false;
                  home-manager.extraSpecialArgs = { flakes = inputs; };
                  home-manager.users.${username}.imports =
                    [ ./common/home-manager/gbrlgn/home.nix ];

                  nix.settings =
                    { substituters = [ "https://cosmic.cachix.org/" ];
                      trusted-public-keys =
                        [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
                    };
                }
              ];

            specialArgs = { flakes = inputs; };
          };

        chokmah = nixpkgs.lib.nixosSystem
          { modules =
              [ ./system/chokmah/configuration.nix
                home-manager.nixosModules.home-manager
                { home-manager.useGlobalPkgs = false;
                  home-manager.extraSpecialArgs = { flakes = inputs; };
                  home-manager.users.${username}.imports =
                    [ ./common/home-manager/gbrlgn/home.nix ];
                }
              ];

            specialArgs = { flakes = inputs; };
          };
      };
  };
}

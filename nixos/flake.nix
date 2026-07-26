{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra/4.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  };

  outputs = {
    nixpkgs,
    nixpkgs-stable,
    nixos-wsl,
    home-manager,
    plasma-manager,
    nixvim,
    sops-nix,
    minegrub-theme,
    ...
  } @ inputs: let
    overlays = [];
    baseHomeManagerConfig = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
    };
    commonHomeManagerModules = [
      nixvim.homeModules.nixvim
    ];
    defaultModules = [
      {_module.args = {inherit inputs;};}
      home-manager.nixosModules.home-manager
      baseHomeManagerConfig
      sops-nix.nixosModules.sops
    ];
    mkPkgs = system:
      import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
        config.permittedInsecurePackages = ["electron-40.10.5"]; # FIXME
      };
    mkPkgsStable = system:
      import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    mkSystem = extraModules:
      nixpkgs.lib.nixosSystem rec {
        pkgs = mkPkgs "x86_64-linux";
        system = "x86_64-linux";
        modules = defaultModules ++ extraModules;
      };
  in {
    nixosConfigurations = {
      nocebo = mkSystem [
        nixos-wsl.nixosModules.default
        ./hosts/nocebo/configuration.nix
        {
          home-manager.sharedModules = commonHomeManagerModules ++ [];
        }
      ];
      positron = mkSystem [
        ./hosts/positron/configuration.nix
        minegrub-theme.nixosModules.default
        {
          home-manager.extraSpecialArgs = {pkgs-stable = mkPkgsStable "x86_64-linux";};
          home-manager.sharedModules =
            commonHomeManagerModules
            ++ [
              plasma-manager.homeModules.plasma-manager
            ];
        }
      ];
    };
  };
}

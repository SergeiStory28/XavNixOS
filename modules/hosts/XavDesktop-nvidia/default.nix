{self, inputs, ... }: {

  flake.nixosConfigurations.DesktopNvidia = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.DesktopConfiguration
    ];
  };
}

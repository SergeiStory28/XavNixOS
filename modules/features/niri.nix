{self, inputs, ... }: {

  flake.nixosModules.niri = { pkgs, lib, ...}: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.xavNiri;
    };
  };

  perSystem = { pkgs, lib, self',... }: {

    packages.xavNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      settings = {
        input.keyboard = {
          xkb.layout = "us,ua";
        };

        xwayland-satelitte.path = 
          lib.getExe pkgs.xwayland-satelitte;

        layout.gaps = 5;

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;
        };
      };
    };
  };
}
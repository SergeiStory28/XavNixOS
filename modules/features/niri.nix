{self, inputs, ... }: {

  perSystem = { pkgs, ... }: {

    packages.xavNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      settings = {
        input.keyboard = {
          xkb.layout = "us,ua";
        };

        layout.gaps = 5;

        binds = {
          "Mod+Return".spawn-sh = lib.getExe pkgs.kitty;
          "Mod+Q".close-window = null;
        };
      };
    };
  };
}
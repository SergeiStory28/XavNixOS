{ self, inputs, ... }: {

  perSystem = { pkgs, ... }: {

    packages.xavNoctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      settings = {};
    };
  };
}
{self, inputs, ... }: {

  flake.nixosModules.LaptopConfiguration = {pkgs, lib, ...}: {
    imports = [
      #self.nixosModules.LaptopConfiguration
    ];

    # Networking
    networking.hostName = "Xav-Laptop";
    networking.networkmanager.enable = true;
    time.timeZone = "America/Los_Angeles";
    i18n.defaultLocale = "en_US.UTF-8";

    # Firewall
    networking.firewall.enable = true;

    # Bootloader
    boot.loader.limine.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Laptop Power
    services.thermald.enable = true; 
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };

    # Hardened Malloc
    environment.memoryAllocator.provider = "graphene-hardened";

    # User
    users.users.benw = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" "video" ];
    };

    # Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    programs.gamemode.enable = true;

    # System Packages
    environment.systemPackages = with pkgs; [
      # Browser
      google-chrome
      
      # IDE/Editors
      vim
      vscodium
      kate

      # Devtools
      zig
      zls

      # Utilities
      git
      wget
      pciutils
      brightnessctl

    ];

    # Unfree Software
    nixpkgs.config.allowUnfree = true;

    # System Version (Fill in the installed version here)
    system.stateVersion = "25.11";

  };
}
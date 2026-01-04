{ config, pkgs, inputs, ... }:

{
  users.users.darlene = {
    # Generate password hash with command `mkpasswd mysecretpassword`
    hashedPasswordFile = config.age.secrets.passwdhash-gemma.path;
    isNormalUser = true;
    description = "Gemma";
    extraGroups = [
      "networkmanager"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
    ];
    packages = with pkgs; [
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };

  home-manager.users.darlene = import ../../../home/gemma/darkarmy.nix;
}

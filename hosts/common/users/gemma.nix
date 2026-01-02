{ pkgs, inputs, ... }:

{
  users.users.darlene = {
    # Generate password hash with command `mkpasswd mysecretpassword`
    initialHashedPassword = "$y$j9T$2dR1Z8nl.g9YjD/Acnp84.$krbE0QynKn6NiSDjA2WGuqCScYsZhH.WezG8nDMaRZ3";
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

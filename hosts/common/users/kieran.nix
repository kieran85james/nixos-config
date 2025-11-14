{ config, pkgs, ... }:

let
  # Dynamically determine the username based on the hostname
  dynamicUser = if config.networking.hostName == "e-corp" then "phillip"
                else if config.networking.hostName == "darkarmy" then "otto"
                else "elliot";
in
{
  users.users."${dynamicUser}" = {
    # Generate password hash with command `mkpasswd mysecretpassword`
    initialHashedPassword = "$y$j9T$2dR1Z8nl.g9YjD/Acnp84.$krbE0QynKn6NiSDjA2WGuqCScYsZhH.WezG8nDMaRZ3";
    isNormalUser = true;
    description = "${dynamicUser}";
    extraGroups = [
      "wheel"
      "docker"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];

    packages = with pkgs; [
      stable.firefox
      stable.vscode
      stable.jetbrains.phpstorm
      stable.dbeaver-bin
      # stable.postman
      stable.slack
    ];
  };

  nix.settings.trusted-users = [ dynamicUser ];

  home-manager.users."${dynamicUser}" = import ../../../home/kieran/${config.networking.hostName}.nix;
}

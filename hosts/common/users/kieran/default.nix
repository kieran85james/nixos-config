{ pkgs, ... }:

{
  users.users.kieran = {
    # Generate password hash with command `mkpasswd mysecretpassword`
    initialHashedPassword = "$y$j9T$2dR1Z8nl.g9YjD/Acnp84.$krbE0QynKn6NiSDjA2WGuqCScYsZhH.WezG8nDMaRZ3";
    isNormalUser = true;
    description = "Kieran";
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

  nix.settings.trusted-users = [ "kieran" ];
}

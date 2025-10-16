{ pkgs, ... }:

{
  users.users.kieran = {
    # Generate password hash with command `mkpasswd mysecretpassword`
    # initialHashedPassword = "";
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

{ config, pkgs, inputs, ... }:

let
  # Dynamically determine the username based on the hostname
  dynamicUser = if config.networking.hostName == "e-corp" then "phillip"
                else if config.networking.hostName == "darkarmy" then "otto"
                else "elliot";
in
{
  users.users."${dynamicUser}" = {
    # Generate password hash with command `mkpasswd --method=sha512crypt`
    # initialHashedPassword = "$6$eYMRJK285250PLWQ$6DWnl0IcAApJe9OM..VAMbqqaYECf6bghc50xyR1K/Rf5JjH56bseWpYP6ArK2kgpFg7p0VO1AB6BNGJa7/SZ0";
    hashedPasswordFile = config.age.secrets.kieran-passwdhash.path;
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
    packages = [
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };

  nix.settings.trusted-users = [ dynamicUser ];

  home-manager.users."${dynamicUser}" = import ../../../home/kieran/${config.networking.hostName}.nix;
}

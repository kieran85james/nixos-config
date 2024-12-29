{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # agenix
    colordiff
    curl
    git
    htop
    neofetch
    p7zip
    rsync
    unrar
    unzip
    wget
    wireguard-tools
    zsh
  ];

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
}
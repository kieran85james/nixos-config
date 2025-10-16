{ pkgs, ... }:

{
  environment.systemPackages = (with pkgs; [
    stable.colordiff
    stable.curl
    stable.git
    stable.htop
    stable.neofetch
    stable.p7zip
    stable.rsync
    stable.unrar
    stable.unzip
    stable.wget
    stable.nano
    stable.wireguard-tools
  ]);

  programs.nano = {
    enable = true;
    syntaxHighlight = true;
  };
}

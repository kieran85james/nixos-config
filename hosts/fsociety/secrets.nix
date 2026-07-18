{ config, ... }:

let
  # Dynamically determine the username based on the hostname
  dynamicUser = if config.networking.hostName == "e-corp" then "phillip"
                else if config.networking.hostName == "darkarmy" then "otto"
                else "elliot";
in
{
  age = {
    # Required for agenix if OpenSSH is disabled.
    identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      "/home/${dynamicUser}/.ssh/kieran"
    ];

    secrets = {
      # Kieran
      passwdhash-kieran = {
        file = ../../secrets/passwdhash-kieran.age;
      };
      ssh-config-kieran = {
        file = ../../secrets/ssh-config-kieran.age;
        owner = "${dynamicUser}";
      };
      
      # Gemma
      passwdhash-gemma = {
        file = ../../secrets/passwdhash-gemma.age;
      };
    };
  };
}

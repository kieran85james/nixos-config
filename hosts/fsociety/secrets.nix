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
        group = "users";
        mode = "0600";
      };
      ssh-github-authentication-public-kieran = {
        file = ../../secrets/ssh-github-authentication-public-kieran.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0644";
        path = "/home/${dynamicUser}/.ssh/github_authentication.pub";
      };
      ssh-github-authentication-private-kieran = {
        file = ../../secrets/ssh-github-authentication-private-kieran.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0600";
        path = "/home/${dynamicUser}/.ssh/github_authentication";
      };
      ssh-github-signing-public-kieran = {
        file = ../../secrets/ssh-github-signing-public-kieran.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0644";
        path = "/home/${dynamicUser}/.ssh/github_signing.pub";
      };
      ssh-github-signing-private-kieran = {
        file = ../../secrets/ssh-github-signing-private-kieran.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0600";
        path = "/home/${dynamicUser}/.ssh/github_signing";
      };
      
      # Gemma
      passwdhash-gemma = {
        file = ../../secrets/passwdhash-gemma.age;
      };
    };
  };
}

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
      kieran-passwdhash = {
        file = ../../secrets/kieran/passwdhash.age;
      };
      kieran-ssh-config = {
        file = ../../secrets/kieran/ssh-config.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0600";
      };
      kieran-ssh-github-public = {
        file = ../../secrets/kieran/ssh-github-public.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0644";
        path = "/home/${dynamicUser}/.ssh/github.pub";
      };
      kieran-ssh-github-private = {
        file = ../../secrets/kieran/ssh-github-private.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0600";
        path = "/home/${dynamicUser}/.ssh/github";
      };
      kieran-ssh-git-public = {
        file = ../../secrets/kieran/ssh-git-public.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0644";
        path = "/home/${dynamicUser}/.ssh/git.pub";
      };
      kieran-ssh-git-private = {
        file = ../../secrets/kieran/ssh-git-private.age;
        owner = "${dynamicUser}";
        group = "users";
        mode = "0600";
        path = "/home/${dynamicUser}/.ssh/git";
      };
      
      # Gemma
      gemma-passwdhash = {
        file = ../../secrets/gemma/passwdhash.age;
      };
    };
  };
}

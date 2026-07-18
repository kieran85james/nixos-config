{
  age = {
    # Required for agenix if OpenSSH is disabled.
    identityPaths = [
      "/etc/ssh/ssh_host_ed25519_key"
      "/home/elliot/.ssh/kieran"
    ];
    secrets = {
      passwdhash-kieran = {
        file = ../../secrets/passwdhash-kieran.age;
      };
      passwdhash-gemma = {
        file = ../../secrets/passwdhash-gemma.age;
      };
    };
  };
}

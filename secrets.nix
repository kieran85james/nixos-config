let
  # SYSTEMS
    fsociety = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8F2M3WATph6vdRsTmP1VbRCdBoP1Ra2LOvfU2tYjMj";

  systems = [ fsociety ];

  # USERS
  kieran = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAkCuJkgNsTQp/eEFj6T+t6EDyc5Fw2SMzqVyV4Qt/ne";
  
  users = [ kieran ];
in {
  "secrets/passwdhash-kieran.age".publicKeys = systems ++ users;
  "secrets/passwdhash-gemma.age".publicKeys = systems ++ users;
  # "secrets/ssh-config.age".publicKeys = systems ++ users;
}

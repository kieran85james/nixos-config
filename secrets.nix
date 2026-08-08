let
  # SYSTEMS
  fsociety = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8F2M3WATph6vdRsTmP1VbRCdBoP1Ra2LOvfU2tYjMj";

  systems = [ fsociety ];

  # USERS
  kieran = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAkCuJkgNsTQp/eEFj6T+t6EDyc5Fw2SMzqVyV4Qt/ne";
  
  users = [ kieran ];
in {
  "secrets/kieran/passwdhash.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-config.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-git-public.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-git-private.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-github-public.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-github-private.age".publicKeys = systems ++ users;
  
  "secrets/gemma/passwdhash.age".publicKeys = systems ++ users;
}

let
  # SYSTEMS
  fsociety = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID8F2M3WATph6vdRsTmP1VbRCdBoP1Ra2LOvfU2tYjMj";
  darkarmy = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL6WRs1Kxb1KMAWHFwX7B4KZ637oxFeTGGcg6kEpDQPi";

  systems = [ fsociety darkarmy ];

  # USERS
  kieran = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAkCuJkgNsTQp/eEFj6T+t6EDyc5Fw2SMzqVyV4Qt/ne";
  otto = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF7AOal/tzyM2wsXCHFbsmUsBWb4tHeKd3vLsMNee3bv";
  
  users = [ kieran otto ];
in {
  "secrets/kieran/passwdhash.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-config.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-git-public.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-git-private.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-github-public.age".publicKeys = systems ++ users;
  "secrets/kieran/ssh-github-private.age".publicKeys = systems ++ users;
  
  "secrets/gemma/passwdhash.age".publicKeys = systems ++ users;
}

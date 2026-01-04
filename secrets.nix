let
  # SYSTEMS
  fsociety = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIACBLrFKo+gs/v3E7FMoNTMiFsah3JVOyZPUb05dnTdV";

  systems = [ fsociety ];

  # USERS
  kieran = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMz2Et0wLUopvcjxfQ/LGfxhWWu/WF2xsgUPvqgUeQyR";
  
  users = [ kieran ];
in {
  "secrets/passwdhash-kieran.age".publicKeys = systems ++ users;
  "secrets/passwdhash-gemma.age".publicKeys = systems ++ users;
  "secrets/ssh-config.age".publicKeys = systems ++ users;
}

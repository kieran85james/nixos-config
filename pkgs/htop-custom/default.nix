# Example override to use a specific version of htop from its GitHub repository.
# Leave hash empty and it will generate on rebuild. Don't forget to add generated hash.
{
  fetchFromGitHub,
  htop,
}:
htop.overrideAttrs (oldAttrs: rec {
  pname = oldAttrs.pname;
  version = "3.1.0";

  src = fetchFromGitHub {
    owner = "htop-dev";
    repo = "htop";
    rev = version;
    hash = "";
  };
})

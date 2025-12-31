{config, ...}:
let
  # Dynamically determine the username based on the hostname
  dynamicUser = if config.networking.hostName == "e-corp" then "phillip"
                else if config.networking.hostName == "darkarmy" then "otto"
                else "elliot";
in {
  services.displayManager.autoLogin = {
    enable = true;
    user = "${dynamicUser}";
  };
}

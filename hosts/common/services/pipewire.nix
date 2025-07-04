{ pkgs, ... }:
{
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/99-disable-idle-timeout.conf" ''
          monitor.alsa.rules = [
            {
              matches = [
                { node.name = "~alsa_input.*" }
                { node.name = "~alsa_output.*" }
              ]
              actions = {
                update-props = {
                  session.suspend-timeout-seconds = 0,
                }
              }
            }
          ]
        '')
      ];
    };
  };
}
{ pkgs, ... }:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
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

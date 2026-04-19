{ pkgs, ... }:

{
  # Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    extraConfig = {
      pipewire."99-deepfilternet" = {
        "context.properties" = {
          "link.max-buffers" = 16;
          "core.daemon" = true;
          "core.name" = "pipewire-0";
          "module.x11.bell" = false;
          "module.access" = true;
          "module.jackdbus-detect" = false;
        };

        "context.modules" = [
          {
            name = "libpipewire-module-filter-chain";
            args = {
              "node.description" = "DeepFilter Noise Canceling source";
              "media.name" = "DeepFilter Noise Canceling source";

              "filter.graph".nodes = [
                {
                  type = "ladspa";
                  name = "DeepFilter Mono";
                  plugin = "${pkgs.deepfilternet}/lib/ladspa/libdeep_filter_ladspa.so";
                  label = "deep_filter_mono";
                  control = {
                    "Attenuation Limit (dB)" = 100;
                  };
                }
              ];
              "audio.rate" = 48000;
              "audio.position" = "[MONO]";
              # "capture.props"."node.passive" = true;
              "capture.props"."target.object" =
                "alsa_input.usb-Solid_State_System_Co._Ltd._MMX_150-00.mono-fallback";
              "playback.props"."media.class" = "Audio/Source";
            };
          }
        ];
      };
    };
  };
}

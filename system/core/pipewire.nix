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

      pipewire."10-rates" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.allowed-rates" = [
            44100
            48000
          ];
          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 512;
        };
      };

      pipewire."20-pebble-v3" = {
        "context.objects" = [
          {
            factory = "spa-node-factory";
            args = {
              "factory.name" = "api.alsa.pcm.sink";
              "node.name" = "alsa_output.usb-ACTIONS_Pebble_V3-00.pro-output-0";
              "api.alsa.period-size" = 512;
              "api.alsa.headroom" = 512;
            };
          }
        ];
      };
    };
  };
  environment.systemPackages = with pkgs; [ deepfilternet ];

  systemd.user.services.pipewire = {
    serviceConfig = {
      Environment = "LADSPA_PATH=${pkgs.deepfilternet}/lib/ladspa";
    };
  };
}

{
  flake.modules.nixos.hermes-config =
    let
      toolsets = [
        "terminal"
        "file"
      ];

      hermesConfig = {
        model = {
          provider = "openai-codex";
          default = "gpt-5.6-luna";
        };

        fallback_providers = [
          {
            provider = "opencode-zen";
            model = "deepseek-v4-flash-free";
          }
        ];

        plugins.enabled = [ "ponytail" ];

        agent = {
          max_turns = 30;
          tool_use_enforcement = true;
          verify_on_stop = true;
        };

        approvals.mode = "manual";

        display = {
          skin = "catppuccin-mocha";
          interface = "tui";
        };

        terminal = {
          backend = "local";
          cwd = ".";
          timeout = 120;
        };

        platform_toolsets = {
          cli = toolsets;
          tui = toolsets;
          discord = toolsets;
        };

        security = {
          redact_secrets = true;
          allow_lazy_installs = false;
        };

        memory = {
          memory_enabled = true;
          user_profile_enabled = true;
        };
      };
    in
    {
      environment.etc."hermes/config.yaml" = {
        mode = "0644";
        text = builtins.toJSON hermesConfig;
      };
    };
}

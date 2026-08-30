{
  flake.modules.nixos.hermes = { lib, ... }: {
    services.hermes-agent.settings = {
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
        cwd = "/home/stalkingwolf/hermes/workspace";
        timeout = 120;
      };
      platform_toolsets = {
        cli = [
          "terminal"
          "file"
          "web"
        ];
        tui = [
          "terminal"
          "file"
          "web"
        ];
        discord = [
          "terminal"
          "file"
          "web"
        ];
      };
      security = {
        redact_secrets = true;
        allow_lazy_installs = false;
      };
      web.backend = "ddgs";
      memory = {
        memory_enabled = true;
        user_profile_enabled = true;
        write_approval = true;
      };
      skills.write_approval = true;
    };
    systemd.services.hermes-agent.serviceConfig = {
      ProtectHome = lib.mkForce "read-only";
      ReadWritePaths = [ "/home/stalkingwolf/hermes" ];
    };
  };
}

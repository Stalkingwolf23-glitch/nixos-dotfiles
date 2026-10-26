{
  pins = {
    llm-agents = {
      url = "https://github.com/numtide/llm-agents.nix";
      follows.nixpkgs = "nixpkgs";
    };
    mattpocock-skills = {
      url = "https://github.com/mattpocock/skills";
      rev = "49dd158";
      flake = false;
    };
    ponytail = {
      url = "https://github.com/DietrichGebert/ponytail";
      flake = false;
    };
    mcp-nixos.url = "https://github.com/utensils/mcp-nixos";
  };

  flake.modules.nixos.hermes = {
    nix.settings = {
      extra-substituters = ["https://cache.numtide.com"];
      extra-trusted-public-keys = ["nixs3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="];
    };
  };

  flake.modules.homeManager.hermes = {
    pkgs,
    inputs,
    lib,
    ...
  }: let
    hermesPackage = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.hermes-agent.overridePythonAttrs (old: {
      # TODO: Drop when unpatched Hermes passes pythonRuntimeDepsCheckHook with pinned nixpkgs.
      # Source pins: prompt_toolkit==3.0.52, Markdown==3.10.2:
      # https://github.com/NousResearch/hermes-agent/blob/4d04303818b61bf3aa09278af48356315515965b/pyproject.toml
      postPatch =
        (old.postPatch or "")
        + ''
          substituteInPlace pyproject.toml \
            --replace-fail 'prompt_toolkit==3.0.52' 'prompt_toolkit==${pkgs.python3Packages.prompt-toolkit.version}' \
            --replace-fail 'Markdown==3.10.2' 'Markdown==${pkgs.python3Packages.markdown.version}'
        '';
    });
    theme = import ./_theme.nix;
    hermesConfig = {
      model = {
        provider = "openai-codex";
        default = "gpt-6.1-sol-900k";
      };
      display = {
        interface = "tui";
        skin = theme.name;
        show_reasoning = true;
      };
      terminal = {
        backend = "local";
        cwd = "/home/stalkingwolf/hermes/workspace";
        timeout = 120;
      };
      web.search_backend = "ddgs";
      platform_toolsets = {
        tui = ["hermes-cli"];
        desktop = ["hermes-cli"];
      };
      database.journal_mode = "wal";
      agent.verify_on_stop = true;
      checkpoints = {
        enabled = true;
        max_snapshots = 20;
      };
      security.allow_lazy_installs = false;
      plugins.enabled = ["ponytail"];
      # Use upstream's scoped FastMCP/MCP stack until nixpkgs is compatible.
      mcp_servers.nixos = {
        command =
          pkgs.lib.warnIfNot
          (pkgs.python3Packages.fastmcp-slim.meta.broken or false)
          ''
            nixpkgs fastmcp-slim is no longer marked broken.
            Test pkgs.mcp-nixos; if it works, remove the separate mcp-nixos input.
          ''
          "${inputs.mcp-nixos.packages.${pkgs.stdenv.hostPlatform.system}.mcp-nixos}/bin/mcp-nixos";
        # command = "${pkgs.mcp-nixos}/bin/mcp-nixos";
      };
      supports_parallel_tool_calls = true;
      sampling.enabled = false;
    };
    mergeConfig = import ./_configMergeScript.nix {inherit pkgs;};
    declaredConfig = pkgs.writeText "hermes-config.json" (builtins.toJSON hermesConfig);

    hermesPackages = [
      hermesPackage
      pkgs.ffmpeg
      pkgs.python3
      pkgs.python313Packages.ddgs
    ];

    soulText = ''
      	# Working agreement

       - Be concise, direct and technical. Lead with the answer; skip praise and filler.
       - Default to research and options. Edit only when explicitly asked.
       - Make the smallest complete change. Reuse existing patterns; avoid speculative abstractions.
       - Verify uncertain technical claims against the actual configuration or authoritative documentation. State unresolved uncertainty and challenge false premises.
       - Inspect the relevant code and callers before editing. Preserve unrelated changes, inspect the final diff and run appropriate validation. Report what was actually checked and any blockers.

       ## Boundaries and safety

       - Create and modify task files only under `/home/stalkingwolf/hermes/workspace`. Treat original repositories outside it as read-only.
       - For repository changes, clone or copy the target into the workspace and edit that checkout. Produce standalone patches only when requested.
       - Do not activate system configurations or run destructive Git/filesystem operations without explicit approval.
       - Never expose secrets in output, commits or the Nix store.
       - Preserve security and persistence protections. Explain consequences before proposing changes that weaken them; verify durability before changing persistence.
       - Inspect the actual target host. For remote systems such as Cocytus, use SSH rather than assuming the Hermes host represents them.
       - Follow repository-specific instructions for structure, formatting and validation.
    '';
  in {
    home.sessionVariables.HERMES_HOME = "/home/stalkingwolf/hermes/.hermes";
    home.packages = hermesPackages;
    home.activation.hermesConfig = lib.hm.dag.entryAfter ["linkGeneration"] ''
      run mkdir -p "$HOME/hermes/.hermes"
      run ${mergeConfig} ${declaredConfig} "$HOME/hermes/.hermes/config.yaml"
      run chmod 0600 "$HOME/hermes/.hermes/config.yaml"
    '';
    home.activation.hermesSoul = lib.hm.dag.entryAfter ["linkGeneration"] ''
      run mkdir -p "$HOME/hermes/.hermes"
      run install -m 0600 -D \
        ${pkgs.writeText "hermes-SOUL.md" soulText} \
        "$HOME/hermes/.hermes/SOUL.md"
    '';
    home.file = {
      "hermes/.hermes/skins/${theme.name}.yaml".text = builtins.toJSON theme;
      "hermes/.hermes/skills/mattpocock/engineering".source = "${inputs."mattpocock-skills"}/skills/engineering";
      "hermes/.hermes/skills/mattpocock/productivity".source = "${inputs."mattpocock-skills"}/skills/productivity";
    };
  };
}

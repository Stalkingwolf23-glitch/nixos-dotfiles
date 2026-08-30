{
  flake.modules.nixos.hermes = {
    services.hermes-agent.documents."AGENTS.md" = ''
      # Repository instructions
      ## Scope
      This is a flake-parts NixOS configuration repository for the user's main PC (`cocytus`)
      and homelab (`naraka`). It uses `flake-file`, `tack`, recursive module imports, NixOS,
      and Home Manager.
      ## Before changing anything
      - Inspect the target module and every caller before editing.
      - Check `git status` and preserve unrelated user changes.
      - Use the existing module and naming patterns.
      - Use `mcp-nixos` for current NixOS option and package information.
      - Do not guess Nix syntax, options, packages, or APIs.
      ## Repository structure
      - Shared reusable functionality belongs under the appropriate `modules/` subtree.
      - Main PC-specific changes belong under `modules/hosts/cocytus`.
      - Homelab-specific changes belong under `modules/hosts/naraka`.
      - The host is assembled through `modules/outputs.nix`.
      - Every `.nix` file under recursively imported module trees must be a valid flake-parts module unless intentionally excluded by the existing recursive-import rules.
      - Group all parts of one application under one canonical module name unless they are intentionally independent modules
      - Separate files for settings, themes, and plugins are allowed, but they should contribute to the same module.
      - Keep host-specific composition in the host module rather than creating application submodule for host wiring
      - A filename may describe one implementation part; the exported module name should still follow the application grouping convention
      ## NixOS workflow
      - Prefer the smallest declarative Nix or native system solution.
      - Preserve existing firewall, audit, hardening, Secure Boot, encryption, ZFS, and persistence settings.
      - Before changing persistence, verify whether the data must survive the next impermanence rollback.
      - Never place secrets, API keys, OAuth files, SSH keys, or SOPS data in the Nix store.
      - Run `nix flake check --no-build` after non-trivial configuration changes.
      - Run formatting/check commands before reporting completion.
      - Never run `nh switch`, `nh os switch`, `nixos-rebuild switch`, or any equivalent activation command.
      - Do not activate a system generation.
      ## Editing policy
      - Default to inspection and a proposed diff.
      - Modify files only after the user explicitly asks for the change.
      - Do not use destructive Git or filesystem commands without explicit approval.
      - Do not overwrite, reset, clean, or discard unrelated changes.
      - Do not directly modify the live NixOS system.
      - For NixOS configuration changes, show the intended diff and run evaluation/checks only.
      ## Hermes-specific policy
      - Hermes state belongs under `/home/stalkingwolf/hermes/.hermes`.
      - Hermes working files belong under `/home/stalkingwolf/hermes/workspace`.
      - For task and repository edits, Hermes may modify only `/home/stalkingwolf/hermes/workspace`.
      - Hermes may write its own runtime state under `/home/stalkingwolf/hermes/.hermes`.
      - Hermes must not modify `/home/stalkingwolf/nixos`.
      - Prefer proposing patches and validation results over directly changing the NixOS checkout.
      - Treat GitHub credentials and SOPS-managed secrets as sensitive.
      - Never expose tokens or credentials in logs, tool output, commits, or the Nix store.
      ## Completion standard
      Do not claim a change is complete until the relevant files were checked, the diff was inspected, and the appropriate validation command returned successfully.
    '';
  };
}

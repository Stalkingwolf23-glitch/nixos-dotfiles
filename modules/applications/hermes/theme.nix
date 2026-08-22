{
  flake.modules.nixos.hermes = {
    services.hermes-agent.hermesHomeFiles."skins/catppuccin-mocha.yaml" = ''
      name: catppuccin-mocha
      description: Catppuccin Mocha — soothing pastel accents on a dark base

      colors:
        background: "#1e1e2e"
        ui_accent: "#89b4fa"
        banner_accent: "#89b4fa"
        banner_title: "#89b4fa"
        banner_text: "#cdd6f4"
        ui_text: "#cdd6f4"
        ui_primary: "#89b4fa"
        ui_label: "#bac2de"
        banner_dim: "#7f849c"
        banner_border: "#45475a"
        ui_border: "#45475a"
        ui_tool: "#89b4fa"
        ui_thinking: "#a6adc8"
        ui_ok: "#a6e3a1"
        ui_warn: "#f9e2af"
        ui_error: "#f38ba8"
        prompt: "#89b4fa"
        input_rule: "#89b4fa"
        response_border: "#89b4fa"
        status_bar_bg: "#181825"
        status_bar_text: "#cdd6f4"
        status_bar_good: "#a6e3a1"
        status_bar_warn: "#f9e2af"
        status_bar_bad: "#f38ba8"
        status_bar_critical: "#f38ba8"
        session_label: "#89b4fa"
        session_border: "#45475a"
        diff_added: "#a6e3a1"
        diff_removed: "#f38ba8"
        diff_added_word: "#40a02b"
        diff_removed_word: "#d20f39"
        syntax_string: "#a6e3a1"
        syntax_number: "#fab387"
        syntax_keyword: "#89b4fa"
        syntax_comment: "#6c7086"
        completion_menu_bg: "#181825"
        completion_menu_current_bg: "#313244"
        completion_menu_meta_bg: "#1e1e2e"

      branding:
        agent_name: Plana Nocturne
        prompt_symbol: "❯"
        help_header: ""

      tool_prefix: "┊"
    '';
  };
}

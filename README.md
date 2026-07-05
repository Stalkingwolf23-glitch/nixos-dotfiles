<div align="center">

# NixOS Dotfiles

Personal NixOS + Home Manager configuration, managed with flakes.

[![NixOS](https://img.shields.io/badge/NixOS-unstable-5277C3?style=flat-square&logo=nixos&logoColor=white)](https://nixos.org)
[![Niri](https://img.shields.io/badge/Compositor-niri-8caaee?style=flat-square)](https://github.com/YaLTeR/niri)
[![Flakes](https://img.shields.io/badge/Nix-Flakes-a6d189?style=flat-square&logo=nixos&logoColor=white)](https://nixos.wiki/wiki/Flakes)

</div>

---

## Stack

| Layer | Choice |
|---|---|
| Kernel | CachyOS (performance-patched) |
| Compositor | [niri](https://github.com/YaLTeR/niri) (tiling Wayland) |
| Theme | Stylix · Catppuccin Mocha · Maple Mono NF CN · Papirus icons |
| Shell | zsh + starship |
| Editor | Neovim via [kickstart.nixvim](https://github.com/Stalkingwolf23-glitch/kickstart.nixvim) |
| Browser | Zen (beta) |
| Greeter | noctalia-greeter |

## Layout

```
system/         # NixOS system config (auto-imported recursively)
  core/         # kernel, boot, network, pipewire, greetd, time
  hardware/     # drives, keyboard, hardware-configuration.nix
  wm/           # niri (system-level)
  app/          # steam, syncthing
  security/     # user accounts, sudo

user/           # Home Manager config (auto-imported recursively)
  app/          # nixvim, rofi, zen, dolphin, …
  shell/        # zsh, starship, git, yazy, btop, mpd, nh
  style/        # stylix theming

assets/
  config/       # live-editable raw configs (niri KDL, rofi, fastfetch, rmpc, …)
  zen/          # userChrome.css, user.js, userContent.css

overlays/       # custom nixpkgs overlays
```

`system/` and `user/` are recursively auto-imported — files prefixed with `_` are skipped.

Niri config and other runtime dotfiles under `assets/config/` are symlinked via `mkOutOfStoreSymlink`, so they're live-editable without a rebuild.

## Usage

```bash
# Apply NixOS system config
nh os switch .

# Apply Home Manager config
nh home switch .

# Build without switching (dry run)
nh os build .
nh home build .

# Garbage collect (keeps 3 gens, drops anything older than 4 days)
nh clean all
```

> Run from `/home/stalkingwolf/local/nixos` — `nh` resolves `.` to that path automatically.

## Notable Inputs

| Input | Purpose |
|---|---|
| `nixpkgs` | nixos-unstable |
| `home-manager` | tracks nixpkgs |
| `stylix` | base16 system-wide theming |
| `niri` / `niri-unstable` | compositor (BANanaD3V/niri-nix + YaLTeR/niri) |
| `nix-cachyos-kernel` | pinned CachyOS kernel overlay |
| `zen-browser` | Zen browser (beta channel) |
| `noctalia` / `noctalia-greeter` | custom shell and greeter |
| `kickstart-nixvim` | local nixvim config |

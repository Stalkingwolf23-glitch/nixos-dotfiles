{
  programs.fastfetch = {
    enable = true;
  };

  home.file = {
    ".config/fastfetch/fetch.jsonc".text = ''
      {
          "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
          "logo": {
          	"source": "~/.local/share/avatars/mornye2",
          	"type": "kitty",
              "padding": {
                "top": 4,
                "left": 3
              },
              "height": 24,
              "width": 38
          },
          "display": {
              "color": {
                  "keys": "blue"
              },
              "separator": "",
              "constants": [
                  "─────────────────────────────────────────────────────────",   // {$1} - horizontal line for borders
                  "\u001b[58D",                                               // {$2} - move cursor left 55 columns
                  "\u001b[58C",                                               // {$3} - move cursor right 55 columns
                  "\u001b[57C"                                                // {$4} - move cursor right 54 columns
              ],
              "brightColor": false,
              "bar": {
                  "width": 10,       // Width of percentage bars
                  "border": {
                      "left":"",
                      "right": ""
                  },
                  "char": {
                      "elapsed": "●", // Character for elapsed portion
                      // "elapsed": "■", // Character for elapsed portion
                      "total": ""    // Character for total portion
                  }
              },
              "percent": {
                  "type": 9,         // 1=number, 2=bar, 3=both, 9=colored number
                  "color": {
                      "green": "green",
                      "yellow": "light_yellow",
                      "red": "light_red"
                  }
              }
          },    "modules": [
          "break",
              {
                  "type": "custom",
                  "key": " {#34}┌─────────────┬{$1}┐{#keys} \u001b[37D",
                  "format": ""
              },
              {
                  "type": "os",
                  "key": " {#34}│{#35} OS          {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "kernel",
                  "key": " {#34}│{#35} Kernel      {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "de",
                  "key": " {#34}│{#35} Desktop     {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "wm",
                  "key": " {#34}│{#35} Session     {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "packages",
                  "key": " {#34}│{#35} Packages    {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "uptime",
                  "key": " {#34}│{#35} Uptime      {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "disk",
                  "key": " {#34}│{#35} OS Age      {#34}│{$4}│{#keys} {$2}",
                  "folders": "/",                                   // Check root filesystem
                  "format": "{create-time:10} [{days} days]"        // Show creation time and age in days
              },
              {
                  "type": "custom",
                  "key": " {#34}└─────────────┴{$1}┘{#keys} ",
                  "format": ""
              },
              {
                  "type": "custom",
                  "key": " {#34}┌─────────────┬{$1}┐{#keys} \u001b[37D",
                  "format": ""
              },
              {
                  "type": "host",
                  "key": " {#34}│{#35} Machine     {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "display",
                  "key": " {#34}│{#35} Monitor     {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "cpu",
                  "key": " {#34}│{#35} CPU         {#34}│{$4}│{#keys} {$2}",
                  "format": "{name} @{freq-max} {temperature}",
                  "temp": true,
                  "showPeCoreCount": false
              },
              {
                  "type": "gpu",
                  "key": " {#34}│{#35} GPU         {#34}│{$4}│{#keys} {$2}",
                  "hideType": "integrated",
                  //"format": "{name} {temperature}",
                  "temp": true
              },
              {
                  "type": "custom",
                  "key": " {#34}└─────────────┴{$1}┘{#keys} ",
                  "format": ""
              },

              // Hardware section with cyan color theme
              {
                  "type": "custom",
                  "key": " {#34}┌─────────────┬{$1}┐{#keys} \u001b[37D",
                  "format": ""
              },
              {
              "type": "memory",
              "key": " {#34}│{#35} RAM         {#34}│{$4}│{#keys} {$2}",
              "keyColor": "34",
              "percent": {
              "type": 3, // 3 = show number + bar + percentage
              "green": 30, // <30% is green
              "yellow": 70 // 30-70% is yellow, >70% is red
              }
              },
              {
              "type": "swap",
              "key": " {#34}│{#35} SWAP        {#34}│{$4}│{#keys} {$2}",
              "keyColor": "34",
              "percent": {
              "type": 3,
              "green": 30,
              "yellow": 70
              }
              },
              {
              "type": "disk",
              "keyColor": "34",
              "key": " {#34}│{#35} Disk        {#34}│{$4}│{#keys} {$2}",
              "folders": "/:/home:/mnt/osiris:/mnt/wd_linux",
              "percent": {
              "type": 3,           // 3 = show number + bar + percentage
              "green": 30,         // Below 30% usage is green
              "yellow": 70         // 30-70% is yellow, >70% is red
              }
              },
              {
                  "type": "custom",
                  "key": " {#34}└─────────────┴{$1}┘{#keys} ",
                  "format": ""
              },
              {
                  "type": "custom",
                  "key": " {#34}┌─────────────┬{$1}┐{#keys} \u001b[37D",
                  "format": ""
              },
              {
                  "type": "shell",
                  "key": " {#34}│{#35} Shell       {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "terminal",
                  "key": " {#34}│{#35} Terminal    {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "terminalfont",
                  "key": " {#34}│{#35} Term Font   {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "custom",
                  "key": " {#34}└─────────────┴{$1}┘{#keys} ",
                  "format": ""
              },
              {
                  "type": "custom",
                  "key": " {#34}┌─────────────┬{$1}┐{#keys} \u001b[37D",
                  "format": ""
              },
              {
                  "type": "theme",
                  "key": " {#34}│{#35} Style (Qt)  {#34}│{$4}│{#keys} {$2}",
                  "format": "{theme1}"
              },
              {
                  "type": "theme",
                  "key": " {#34}│{#35} Style (GTK) {#34}│{$4}│{#keys} {$2}",
                  "format": "{theme2}"
              },
              {
                  "type": "wmtheme",
                  "key": " {#34}│{#35} Decor       {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "icons",
                  "key": " {#34}│{#35} Icons       {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "cursor",
                  "key": " {#34}│{#35} Cursors     {#34}│{$4}│{#keys} {$2}"
              },
              {
                  "type": "custom",
                  "key": " {#34}└─────────────┴{$1}┘{#keys} ",
                  "format": ""
              }
          ]
      }
    '';

    ".config/fastfetch/compact.jsonc".text = ''
      {
          "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
          "logo": {
              "source": "~/.local/share/avatars/mornye3",
          	"type": "auto",
          	"height": 15,
              "color": {"1":"white"},
          	"padding": {
          		"top": 1,
              "left": 1
          	}
          },
          "display": {
              "separator": " "
          },
          "modules": [
              "break",
              "break",
                  {
            "key": "  ╭───────────╮",
            "keyColor": "1;1",
            "type": "custom"
          },
          {
            "key": "  {#39}│ {#31}  {#39}user  {#39}│",
            "keyColor": "31;1",
            "outputColor": "31;1",
            "type": "title",
            "format": "{user-name}"
          },
          {
            "key": "  {#39}│ {#33}  {#39}hname  {#39}│",
            "keyColor": "33;1",
            "outputColor": "33;1",
            "type": "title",
            "format": "{host-name}"
          },
          {
            "key": "  {#39}│ {#32}󰻀  {#39}distro {#39}│",
            "keyColor": "32;1",
            "outputColor": "32;1",
            "type": "os",
            "format": "{3}"
          },
          {
            "key": "  {#39}│ {#36}󰌢  {#39}kernel {#39}│",
            "keyColor": "36;1",
            "outputColor": "36;1",
            "type": "kernel",
            "format": "{2}"
          },
          {
            "key": "  {#39}│ {#34}󰅐  {#39}uptime {#39}│",
            "keyColor": "34;1",
            "outputColor": "34;1",
            "type": "uptime",
            "format": "{1}d {2}h {3}m"
          },
          {
            "key": "  {#39}│ {#35}  {#39}shell   {#39}│",
            "keyColor": "35;1",
            "outputColor": "35;1",
            "type": "shell",
            "format": "{1}"
          },
          {
            "key": "  {#39}│ {#31}󰏖  {#39}pkgs   {#39}│",
            "keyColor": "31;1",
            "outputColor": "31;1",
            "type": "packages"
          },
          {
            "key": "  {#39}│ {#33}󰍛  {#39}memory {#39}│",
            "keyColor": "33;1",
            "outputColor": "33;1",
            "type": "memory",
            "format": "{1} | {2}"
          },
          {
            "key": "  ├───────────┤",
            "keyColor": "1;1",
            "type": "custom"
          },
          {
            "key": "  {#39}│ {#39}  {#39}colors  {#39}│",
            "keyColor": "1;1",
            "type": "colors",
            "symbol": "circle"
          },
          {
            "key": "  ╰───────────╯",
            "keyColor": "1;1",
            "type": "custom"
          },
          ]
      }
    '';
  };
}

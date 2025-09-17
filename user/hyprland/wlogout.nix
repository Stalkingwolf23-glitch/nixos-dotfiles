{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wleave # has nicer images that wlogout
  ];

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }

      {
        label = "suspend";
        action = "systemctl suspend-then-hibernate";
        text = "Suspend";
        keybind = "u";
      }

      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }

      {
        label = "logout";
        action = "loginctl kill-session $XDG_SESSION_ID";
        text = "Logout";
        keybind = "e";
      }

      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''
      * {
          background-image: none;
          box-shadow: none;
        }

        window {
          background-color: transparent;
        }

        button {
          border-radius: 10;
          border-color: #89b4fa;
          text-decoration-color: #cdd6f4;
          color: #cdd6f4;
          border-style: solid;
          border-width: 1px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 20%;
        }

        button:focus, button:active, button:hover {
          /* 20% Overlay 2, 80% mantle */
          background-color: rgb(48, 50, 66);
          outline-style: none;
        }
        
      #lock {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/lock.svg")); 
        margin : 10px 0px 10px 0px;
      }

      #logout {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/logout.svg"));
        margin : 10px 0px 10px 0px;
      }

      #shutdown {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/shutdown.svg"));
        margin : 10px 0px 10px 0px;
      }

      #reboot {
        background-image: image(url("${pkgs.wleave}/share/wleave/icons/reboot.svg"));
        margin : 10px 0px 10px 0px;
    '';
  };
}
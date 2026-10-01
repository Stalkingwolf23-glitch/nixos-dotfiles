{
  flake.modules.homeManager.zen = {
    programs.zen-browser.profiles."default" = {
      userChrome = ''
        @import "/home/stalkingwolf/.cache/noctalia/zen-browser/zen-userChrome.css";
          /*################ADDITIONAL CUSTOMIZATIONS###########*/
          /* Hide the audio playing and muted icons in tabs */
          .tab-icon-overlay[muted],

          .tab-icon-overlay[soundplaying] {
            display: none !important;
          }

          /* Hide firefox sound button */
          .tab-audio-button {
            display: none !important;
          }

          /* Minimalistic workspace button */
          .zen-current-workspace-indicator-icon {
            display: none !important;
          }

          #zen-workspaces-button .zen-workspace-icon {
            display: none !important;
          }

          #zen-workspaces-button>toolbarbutton {
            position: relative !important;
          }

          #zen-workspaces-button>toolbarbutton::before {
            position: absolute;
            width: 5px;
            height: 5px;
            content: ''';
            background-color: white;
            border-radius: 50%;
          }

          /* Centered url */
          #urlbar:not([focused]) .urlbar-input {
            text-align: center !important;
          }
      '';
    };
  };
}

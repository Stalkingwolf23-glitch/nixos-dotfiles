{
  flake.modules.homeManager.gameLauncher = {
    home.file.".config/rofi/games.rasi".text = ''
      // Colours
      * {
          background-color:               transparent;
          background:                     #1D2330;
          background-transparent:         #1D2330E0;
          text-color:                     #BBBBBB;
          text-color-selected:            #FFFFFF;
          primary:                        #89B4FA;
          important:                      #BF616A;
      }

      configuration {
          font:                           "Maple Mono 17";
          show-icons:                     true;
      }

      window {
          fullscreen:                     true;
          height:                         100%;
          width:                          100%;
          transparency:                   "real";
          background-color:               @background-transparent;
          border:                         0px 0px 0px 0px;
          border-color:                   @primary;
      }

      mainbox {
          children:                       [prompt, inputbar-box, listview];
          padding:                        0px 0px;
      }

      prompt {
          width:                          100%;
          margin:                         10px 0px 0px 30px;
          text-color:                     @important;
          font:                           "Maple Mono 27";
      }

      listview {
          layout:                         vertical;
          padding:                        60px;
          dynamic:                        true;
          columns:                        6;
          spacing:                        20px;
      }

      inputbar-box {
          children:                       [dummy, inputbar, dummy];
          orientation:                    horizontal;
          expand:                         false;
      }

      inputbar {
          children:                       [textbox-prompt, entry];
          margin:                         0px;
          background-color:               @primary;
          border:                         4px;
          border-color:                   @primary;
          border-radius:                  8px;
      }

      textbox-prompt {
          text-color:                     @background;
          horizontal-align:               0.5;
          vertical-align:                 0.5;
          expand:                         false;
      }

      entry {
          expand:                         false;
          padding:                        8px;
          margin:                         -6px;
          horizontal-align:               0;
          width:                          300;
          background-color:               @background;
          border:                         6px;
          border-color:                   @primary;
          border-radius:                  8px;
          cursor:                         text;
      }

      element {
          children:                       [dummy, element-box, dummy];
          padding:                        5px;
          orientation:                    vertical;
          border:                         0px 4px solid 0px 4px;
          border-color:                   transparent;
          border-radius:                  16;
      }

      element selected {
          border-color:                   @primary;
      }

      element-box {
          children:                       [element-icon, element-text];
          orientation:                    vertical;
          expand:                         false;
          cursor:                         pointer;
      }

      element-icon {
          padding:                        10px;
          cursor:                         inherit;
          size:                           33%;
          margin:                         10px;
      }

      element-text {
          horizontal-align:               0.5;
          cursor:                         inherit;
          text-color:                     @text-color;
      }

      element-text selected {
          text-color:                     @text-color-selected;
      }
    '';

    home.file.".config/rofi/games-smaller.rasi".text = ''
      @import "games"

      window {
          fullscreen:                     false;
          border-radius:                  10px;
          height:                         50%;
          width:                          50%;
      }

      listview {
          columns:                        4;
          padding:                        30px;
      }

      prompt {
          enabled:                        false;
      }

      inputbar {
          margin:                         20px 0px 10px 0px;
      }

      element-icon {
          padding:                        0px 10px;
          size:                           12%;
      }
    '';
  };
}

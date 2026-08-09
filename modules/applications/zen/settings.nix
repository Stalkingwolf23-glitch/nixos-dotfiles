{ inputs, ... }:

{
  flake-file.inputs.betterfox = {
    url = "github:yokoffing/Betterfox";
    flake = false;
  };

  flake.modules.homeManager.zen = { inputs, ... }:
    {
      programs.zen-browser.profiles."default".extraConfig =
        "${builtins.readFile "${inputs.betterfox}/zen/user.js"} ";

    programs.zen-browser.profiles."default".settings = {
      # zen overrides
      "zen.workspaces.continue-where-left-off" = true;
      "zen.workspaces.natural-scroll" = true;
      "zen.welcome-screen.seen" = true;
      "zen.urlbar.behavior" = "float";

      # personal overrides
      "identity.fxaccounts.enabled" = false;
      "browser.firefox-view.feature-tour" = builtins.toJSON {
        screen = "";
        complete = true;
      };
      "signon.rememberSignons" = false;
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      "network.trr.uri" = "https://dns.dnswarden.com/00000000000000000000048"; # Hagezi Light + TIF
      "urlclassifier.trackingSkipURLs" = "embed.reddit.com, *.twitter.com, *.twimg.com";
      "urlclassifier.features.socialtracking.skipURLs" = "*.twitter.com, *.twimg.com";

      # Smoothfox: Natural Smooth Scrolling (120hz+ displays)
      "general.smoothScroll.msdPhysics.enabled" = true;
      "general.smoothScroll.currentVelocityWeighting" = "0.15";
      "general.smoothScroll.stopDecelerationWeighting" = "0.6";
      "mousewheel.min_line_scroll_amount" = 10;
      "general.smoothScroll.mouseWheel.durationMinMS" = 80;
      "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
      "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
      "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
      "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
      "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
      "mousewheel.default.delta_multiplier_y" = 200;
    };
    };
}

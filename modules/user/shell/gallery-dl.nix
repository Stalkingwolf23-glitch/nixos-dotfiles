{
  flake-file.inputs.gallery-dl = {
    url = "git+https://codeberg.org/mikf/gallery-dl";
    flake = false;
  };

  programs.gallery-dl = {
    enable = true;
    settings = {
      base-directory = "~/local/gallery-dl/";
    };
  };
}

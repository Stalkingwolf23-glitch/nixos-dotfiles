{ pkgs }:

pkgs.runCommandLocal "monolisa-monospace" {} ''
  mkdir -p $out/share/fonts/truetype
  cp -r ${../../assets/fonts} $out/share/fonts/truetype
''
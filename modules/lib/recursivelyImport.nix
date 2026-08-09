{ lib }:

# Thanks llakala
# https://github.com/llakala/synaptic-standard/blob/main/demo/recursivelyImport.nix

let
  inherit (lib) hasInfix hasSuffix hasPrefix;
  inherit (builtins)
    concatMap
    isPath
    filter
    readFileType
    ;

  expandIfFolder =
    elem:
    if !isPath elem || readFileType elem != "directory" then
      [ elem ]
    else
      lib.filesystem.listFilesRecursive elem;

in
  list:
  filter
  # Filter out any path that doesn't look like `*.nix`. Don't forget to use
  # toString to prevent copying paths to the store unnecessarily
  # Slightly modified to ignore files with a "_" prefix
  (
    elem:
    !isPath elem
    || (
      let
        path = toString elem;
      in
      hasSuffix ".nix" path
      && !hasPrefix "_" (baseNameOf path)
      && !hasInfix "/lib/" path
      && !hasInfix "/overlays/" path
    )
  )
  # Expand any folder to all the files within it.
  (concatMap expandIfFolder list)

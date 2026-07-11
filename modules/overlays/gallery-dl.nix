inputs: final: prev: {
  gallery-dl = prev.gallery-dl.overrideAttrs (_old: {
    version = "unstable";
    src = inputs.gallery-dl;
  });
}

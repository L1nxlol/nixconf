{
  lib,
  mkHyprlandPlugin,
  fetchFromGitHub,
  wf-touch,
  nix-update-script,
}:

mkHyprlandPlugin {
  pluginName = "hyprglass";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "hyprnux";
    repo = "hyprglass";
    rev = "5bc835dcc909cef6980291688143048cf16942b5";
    hash = "sha256-x/584kY+XXlU/OWKtZAFo89VtowjLXs1DiP9PC0o0Os=";
  };

  buildInputs = [
    wf-touch
  ];

  dontUseCmakeConfigure = true;

  installPhase = ''
    mkdir -p $out/lib
    install -Dm755 hyprglass.so $out/lib/libhyprglass.so
  '';


  doCheck = false;

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Hyprland plugin for blur";
    homepage = "https://github.com/hyprnux/hyprglass";
    license = lib.licenses.bsd3;
    platforms = lib.platforms.linux;
  };
}

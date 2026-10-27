{
  lib,
  stdenvNoCC,
  fetchzip,
  makeWrapper,
  autoPatchelfHook,
  stdenv,
  alsa-lib,
  at-spi2-atk,
  atk,
  cairo,
  cups,
  dbus,
  expat,
  fontconfig,
  freetype,
  gdk-pixbuf,
  glib,
  gtk3,
  libX11,
  libXcomposite,
  libXcursor,
  libXdamage,
  libXext,
  libXfixes,
  libXi,
  libXrandr,
  libXrender,
  libXtst,
  libdrm,
  libsecret,
  libxcb,
  libxshmfence,
  mesa,
  nspr,
  nss,
  pango,
  udev,
  zlib,
}:

stdenvNoCC.mkDerivation rec {
  pname = "kotlin-lsp";
  version = "263.7084.0"; # bump as releases come out

  # exact "Standalone Kotlin LSP Archive → Linux-x64" link from the release page
  src = fetchzip {
    url = "https://github.com/Kotlin/kotlin-lsp/releases/download/v${version}/kotlin-${version}.tar.gz";
    hash = lib.fakeHash; # real sha256 from first failed build
  };

  nativeBuildInputs = [ makeWrapper autoPatchelfHook ];
  buildInputs = [
    stdenv.cc.cc.lib
    glib nss nspr dbus expat alsa-lib libdrm mesa udev zlib
    libX11 libxcb libXcomposite libXdamage libXext libXfixes libXi
    libXrandr libXrender libxshmfence libXtst libXcursor
    atk at-spi2-atk cairo cups fontconfig freetype gdk-pixbuf gtk3
    pango libsecret
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/libexec
    cp -r . $out/libexec/

    if [ -f "$out/libexec/bin/intellij-server" ]; then
      launcher="$out/libexec/bin/intellij-server"   # >= v262.4739.0 layout
    else
      launcher="$out/libexec/kotlin-lsp.sh"         # old layout
    fi
    chmod +x "$launcher"

    makeWrapper "$launcher" $out/bin/kotlin-lsp

    runHook postInstall
  '';

  meta = {
    description = "JetBrains Kotlin Language Server (standalone, binary distribution)";
    homepage = "https://github.com/Kotlin/kotlin-lsp";
    license = lib.licenses.unfree;
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}

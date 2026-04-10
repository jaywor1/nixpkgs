{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  webkitgtk_4_1,
  libsoup_3,
  icu,
  gtk3,
  glib,
  zlib,
  dbus,
  libdrm
}:

stdenv.mkDerivation rec {
  pname = "spacebrowser";
  version = "0.2.7";

  src = fetchurl {
    url = "https://github.com/Kiord/SpaceBrowser/releases/download/v0.2.7/SpaceBrowser-v0.2.7-linux-x64";
    sha256 = "sha256-PQ+7uDtBPmA0oUBk6xKboM8VDVvDpVjKIrfeCIlvqCA=";
  };


  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    webkitgtk_4_1
    libsoup_3
    icu
    gtk3
    glib
    zlib
    dbus
    libdrm
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src $out/bin/spacebrowser
    chmod +x $out/bin/spacebrowser

    runHook postInstall
  '';

  meta = {
    description = "disk cleaner inspired by spacemonger 1.4";
    homepage = "https://github.com/Kiord/SpaceBrowser";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ jaywor1 ];
    platform = [ "x86_64-linux" ];
    mainProgram = "spacebrowser";
  };

}

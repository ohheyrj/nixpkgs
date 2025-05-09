{ lib, stdenvNoCC, fetchurl, undmg }:


stdenvNoCC.mkDerivation {
  pname = "kobo-desktop";
  version = "0-unstable-2025-05-09";

  src = fetchurl {
    url = "https://cdn.kobo.com/downloads/desktop/kobodesktop/kobosetup.dmg";
    hash = "sha256-OHkhC1lPwgoPr3/629FLf8hSVZZhcuAHlREYx0CX7m8=";
  };

  dontPatch = true;
  dontConfigure = true;
  dontBuild = true;
  dontFixup = true;

  buildInputs = [ undmg ];

  sourceRoot = ".";
  installPhase = ''
    runHook preInstall

    mkdir -p $out/Applications
    mv Kobo.app $out/Applications
    '';

    meta = with lib; {
      description = "Kobo Desktop application";
      homepage = "https://www.kobo.com/desktop";
      license = licenses.unfree;
      platforms = platforms.darwin;
      maintainers = with maintainers; [ maintainers.ohheyrj];
    };
}

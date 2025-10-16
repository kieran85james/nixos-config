{
  lib,
  bash,
  makeWrapper,
  stdenv,
}:
stdenv.mkDerivation {
  pname = "image-prep";
  version = "0.0.1";

  src = ./.;

  buildInputs = [];
  nativeBuildInputs = [makeWrapper];

  installPhase = ''
    mkdir -p $out/bin
    cp image-prep.sh $out/bin/image-prep
    wrapProgram $out/bin/image-prep \
      --prefix PATH : ${lib.makeBinPath [bash]}
  '';

  meta = with lib; {
    description = "System imaging preparation tool.";
    platforms = platforms.unix;
  };
}

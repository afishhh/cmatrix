{ pkgs, lib, stdenv, autoreconfHook, ncurses, ... }:

stdenv.mkDerivation {
  name = "cmatrix";
  version = "2.1";

  src = lib.cleanSourceWith { 
    src = ./.;
    filter = path: type: !lib.hasSuffix ".nix" path;
  };

  nativeBuildInputs = [ autoreconfHook ];
  buildInputs = [ ncurses ];

  meta = with lib; {
    description = "Simulates the falling characters theme from The Matrix movie";
    license = licenses.gpl3;
    longDescription = ''
      CMatrix simulates the display from "The Matrix" and is based
      on the screensaver from the movie's website.
    '';
    homepage = "https://github.com/afishhh/cmatrix";
    inherit (ncurses.meta) platforms;
  };
}

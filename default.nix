with import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/b749b2afa6f4ec5467c0e1cb3b86bb6a16056253.tar.gz") {};
mkShell {
  buildInputs = [
    (pkgs.python3.pkgs.callPackage ./contextualized-topic-models.nix {})
    (pkgs.python3.pkgs.callPackage ./fasttext.nix {})
    jupyter
    python3
    python3.pkgs.ipywidgets
  ];
}

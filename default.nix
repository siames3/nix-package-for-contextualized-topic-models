with import <nixpkgs> {};
mkShell {
  propagatedBuildInputs = [
    (pkgs.python3.pkgs.callPackage ./contextualized-topic-models.nix {})
    (pkgs.python3.pkgs.callPackage ./fasttext.nix {})
    jupyter
  ];
}

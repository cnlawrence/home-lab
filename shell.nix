{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "python-env";

  buildInputs = [
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv
  ];

  shellHook = ''
    echo "Welcome to the Python environment!"
    echo "Python version: $(python3 --version)"
    echo "You can now start using Python in this directory."
  '';
}
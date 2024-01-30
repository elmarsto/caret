{
  inputs = {
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs =
    { flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        lib = import ./lib { inherit pkgs; };
        packages.default = import ./default.nix { inherit pkgs; };
      }
    );
}

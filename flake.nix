{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    caret.url = "github:elmarsto/caret.git";
    nixpkgs.url = "github:NixOS/nixpkgs";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { np, fu, gi }: fu.lib.eachDefaultSystem (s:
      let
        app = p: { program = "${p}"; type = "app"; };
        pkgs = import np { inherit s; };
        src = gi.lib.gitignoreSource ./.;
      in
      {
        apps = { };
        devShells = { };
        packages = { };
      }
    );
}




{ pkgs, ... }: pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    just
    jq
    htmlq
    pandoc
  ];
}

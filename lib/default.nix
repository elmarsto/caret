# This is passed into each leaf of the site being built
{ pkgs }:  let
  # utilities for manipulating CSS
  css = import ./css.nix { inherit pkgs; };
  
  # utilities for manipulating HTML
  html = import ./html.nix { inherit pkgs; };

  # utilities for manipulating RSS
  rss = import ./rss.nix { inherit pkgs; };

  # utilities for manipulating URLs
  url = import ./url.nix { inherit pkgs; };
in
{
  inherit css html rss url;
  root = let 
    identity = s: s;
    script = s: pkgs.writeTextFile "caret-root-script" s;
    style = s: pkgs.writeTextFile "caret-root-style" s;
  in {
    inherit script style;
    html = { head, body }: pkgs.writeTextFile "caret-root-doc" ''
      <!DOCTYPE HTML>
      <html>
        <head>
          ${head}
          <link rel="stylesheet" href="${url.ofFile style}" />
          <script type="application/javascript" src="${url.ofFile.script}"></script>
        </head>
        <body>
          ${body}
        </body>
      </html>
    '';
        
  };
} 


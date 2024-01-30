# This is passed into each leaf of the site being built
{ pkgs }: 
{

  # utilities for manipulating CSS
  css = import ./css.nix { inherit pkgs; };
  
  # utilities for manipulating HTML
  html = import ./html.nix { inherit pkgs; };

  # utilities for manipulating RSS
  rss = import ./rss.nix { inherit pkgs; };

  # utilities for manipulating URLs
  url = import ./url.nix { inherit pkgs; };
} 


{
  description = "massivebird's static site, powered by Zola";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
        with pkgs;
      {

        # `nix develop`
        devShell = mkShell {
          buildInputs = [
            zola
          ];
        };
      }
    );
}

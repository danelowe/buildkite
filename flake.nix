{
  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";
      utils.url = "github:numtide/flake-utils";
    };

  outputs = { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            buildkite-agent
          ];
          shellHook = ''
          '';


        };
      }
    );
}

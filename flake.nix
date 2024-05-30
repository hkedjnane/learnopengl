{
  description = "Rust devShell";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
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
        devShells.default = mkShell {
          buildInputs = [
            libgcc
            glfw3
            cmake
            clang-tools

            #GLFW build dependencies
            libxkbcommon
            wayland-scanner
            wayland-protocols
          ];

          shellHook = ''
            export LD_LIBRARY_PATH=${pkgs.wayland}/lib:$LD_LIBRARY_PATH
          '';
        };
      }
    );
}

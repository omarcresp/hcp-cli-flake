{
  description = "HCP cli flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    packages = forAllSystems (system:
      let
        pkgs = import nixpkgs { inherit system; };
        version = "0.6.0";
        sha256 = "0cpx9096vc7ml8gv404z8fn188l6qiwc6zi09bnhwl121awkv2wm";
      in {
        default = pkgs.buildGoModule {
          inherit version;
          pname = "hcp";

          src = builtins.fetchTarball {
            url = "https://github.com/hashicorp/hcp/archive/refs/tags/v${version}.tar.gz";
            inherit sha256;
          };

          vendorHash = "sha256-DDKBBnDypmeWbGaPj1tvqYNzfEVE5Ws8QMz0xRHx8TA=";
          preBuild = ''
            export HOME=$out
          '';
          postFixup = ''
            rm -rf $out/bin/gendocs
            rm -rf $out/bin/mvdocs
          '';
        };
      }
    );
  };
}

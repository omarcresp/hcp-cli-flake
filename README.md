# HCP CLI Nix Flake

This Nix flake provides a convenient way to install and manage the HashiCorp Cloud Platform (HCP) CLI tool using Nix.

## Features

- Installs the HCP CLI tool (version 0.6.0)
- Supports multiple systems: x86_64-linux, aarch64-linux, x86_64-darwin, aarch64-darwin

## Prerequisites

- Nix package manager with flakes enabled

## Usage

1. Add this flake to your `flake.nix`:

```nix
{
  inputs.hcp-cli.url = "github:omarcresp/hcp-cli-flake";
  
  outputs = { self, nixpkgs, hcp-cli }: {
    # Your configurations here
  };
}
```

2. Use the HCP CLI in your configuration:

```nix
environment.systemPackages = [
  hcp-cli.packages.${system}.default
];
```

Or run it directly using:

```sh
nix run github:omarcresp/hcp-cli-flake
```

## Building

To build the package:

```sh
nix build
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Acknowledgments

- HashiCorp for creating the HCP CLI tool
- Nix community for providing the infrastructure to create this flake

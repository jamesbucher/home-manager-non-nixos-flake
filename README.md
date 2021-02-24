# What is this

This is a simple flake configuration for home-manager that can be used independently of NixOS. Normally one calls home-manager flakes from the root NixOS flake to setup all users. However this isn't desired if you want to for example just configure the user without running as root.

# How to use this

You can run:

```
nix build --show-trace .#defaultPackage.x86_64-linux
```

in this repository to build the activation package for the given home-manager session.

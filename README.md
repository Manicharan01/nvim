# Charan's Neovim configuration

The root `init.lua` is the existing desktop profile. The new [`server/`](server/README.md)
profile is standalone, targets **Neovim 0.12.5**, and uses **zero third-party Neovim
plugins**. It is intended for editing shell scripts, Dockerfiles, YAML, and other
configuration files over SSH, with optional native LSP support for development.

See the server README for installation, mappings, optional language servers, and tests.

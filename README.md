# dot-files
My config files for tmux, neovim, etc

## Neovim requirements
Two programs need installed:

- [shark-fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Yubikey SSH Key
To use a SSH key stored on a Yubikey, enable ssh-agent service

**IMPORTANT**: The default name given to the ssh files is incorrect, id_ed25519_sk_rk, needs to be renamed to id_ed25519_sk

See firefox bookmarks for how to copy the ssh key to a system
```bash
systemctl --user start ssh-agent
systemctl --user enable ssh-agent
```

# dot-files
My config files for tmux, neovim, etc

## Neovim requirements
Two programs need installed:

- [shark-fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Yubikey SSH Key
To use a SSH key stored on a Yubikey, enable ssh-agent service
```bash
systemctl --user start ssh-agent
systemctl --user enable ssh-agent
```

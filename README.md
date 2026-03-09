## Managing Dotfiles using GNU stow

### How stow works

Given `/path/to/.`, `stow .` will symlink `.` to `$env.HOME`. e.g. if `pwd` is `/home/dash/dotfiles` and we do `stow .` then `/home/dash/dotfiles/.config` will be symlinked to `$env.HOME/.config`.

Use `.stow-local-ignore` to ignore files and directories.


### Use this repo

1. Install `stow`
1. Clone this repo to `$env.HOME`
1. `cd $"($env.HOME)/dotfiles"; stow .`

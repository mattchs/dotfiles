## Managing Dotfiles using GNU stow

### How stow works

Given `/path/to/dir`, `stow .` will symlink `dir` to `$env.HOME`: `/home/dash/dotfiles/.config` will be symlinked to `$env.HOME/.config`.

Using `.stow-local-ignore` to ignore files and directories.


### Using

1. Install stow
1. Clone this repo to `$env.HOME` 
1. `cd $"($env.HOME)/dotfiles" & stow .`

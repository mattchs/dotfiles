# env.nu
#
# Installed by:
# version = "0.108.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.show_banner = false

$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"
$env.LC_CTYPE = "en_US.UTF-8"

$env.PATH = ($env.PATH | prepend '/home/dash/.local/bin')


$env.SSH_AUTH_SOCK = "/tmp/ssh-agent.sock"

$env.QT_QPA_PLATFORM = 'wayland'
$env.ELM_DISPLAY = 'wl'
$env.SDL_VIDEODRIVER = 'wayland'

$env.TERM = "xterm-256color"

$env.XDG_CONFIG_HOME = '/home/dash/.config'
$env.XDG_DATA_DIRS = (
    [
        "/var/lib/flatpak/exports/share"
        $"($env.HOME)/.local/share/flatpak/exports/share"
        ($env.XDG_DATA_DIRS? | default "/usr/local/share:/usr/share")
    ] | str join ":"
)

$env.FZF_DEFAULT_OPTS = "
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8
--color=selected-bg:#45475A
--color=border:#6C7086,label:#CDD6F4"

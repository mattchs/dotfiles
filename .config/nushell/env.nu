# env.nu
#
# Installed by:
# version = "0.109.1"
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
#
$env.config.show_banner = false

$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"
$env.LC_CTYPE = "en_US.UTF-8"



$env.SSH_AUTH_SOCK = "/tmp/ssh-agent.sock"

$env.QT_QPA_PLATFORM = 'wayland'
$env.ELM_DISPLAY = 'wl'
$env.SDL_VIDEODRIVER = 'wayland'

$env.TERM = "xterm-256color"

$env.XDG_CONFIG_HOME = '/home/dash/.config'
$env.XDG_DATA_HOME = '/home/dash/.local/share'
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

$env.MESA_LOADER_DRIVER_OVERRIDE = "radeonsi"
$env.AMD_VULKAN_ICD = "RADV"



# Load opam environment variables
# This parses the PowerShell output of `opam env` and loads it into the current Nu session.
let opam_env_output = (opam env --shell=powershell | lines)

for line in $opam_env_output {
  # Check if the line matches the expected format, e.g., "$env:VAR_NAME = 'value';"
  if ($line =~ '^\$env:(?<key>[a-zA-Z_]+) = ''(?<val>.*?)'';?$') {
    # Extract key and value and load into environment
    load-env { ($line.key): ($line.val) }
  }
}


# Load ENVs for Path
$env.GHCUP_INSTALL_BASE_PREFIX = '/home/dash'
$env.GOBIN = '/home/dash/go/bin'
$env.GOROOT = '/usr/local/go'
$env.PNPM_HOME = "/home/dash/.local/share/pnpm"
$env.BUN_INSTALL = "/home/dash/.bun"


$env.PATH ++= [
  '/home/dash/.local/bin',
  ($env.GHCUP_INSTALL_BASE_PREFIX + '/.ghcup/bin'),
  $env.GOBIN,
  ($env.GOROOT + "/bin"),
  $env.PNPM_HOME,
  ($env.BUN_INSTALL + '/bin')
]

$env.PATH = ($env.PATH | split row (char esep) | uniq)

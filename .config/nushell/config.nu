# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R


oh-my-posh init nu --config '/home/dash/.config/oh-my-posh/zen.toml'
source $"($nu.home-dir)/.cargo/env.nu"

# ASDF
let shims_dir = (
  if ( $env | get --optional ASDF_DATA_DIR | is-empty ) {
    $env.HOME | path join '.asdf'
  } else {
    $env.ASDF_DATA_DIR
  } | path join 'shims'
)
$env.PATH = ( $env.PATH | split row (char esep) | where { |p| $p != $shims_dir } | prepend $shims_dir )

let asdf_data_dir = (
  if ( $env | get --optional ASDF_DATA_DIR | is-empty ) {
    $env.HOME | path join '.asdf'
  } else {
    $env.ASDF_DATA_DIR
  }
)
source ~/.asdf/completions/nushell.nu


# live server
def live-server [] {
    browser-sync start --server --files "*.html, *.css, *.js"
}

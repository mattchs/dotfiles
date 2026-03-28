def fzgrep [] {
  let result = (
    rg --line-number --no-heading --color=always "" .
    | fzf --ansi --delimiter=":" --preview "bat --color=always --highlight-line {2} {1}" --preview-window="right:60%" --scheme=path --tiebreak=index
  )

  if ($result | is-not-empty) {
    let parts = ($result | split column ":" filename line rest)
    let file = ($parts | first | get filename)
    let line = ($parts | first | get line)

    # Open in nvim at specific line (full path)
    nvim $"+($line)" $file
  }
}


def fzfile [] {
  fd --hidden --type f . | fzf
}

def install-package [] {
  let pkgs = (
    xbps-query -Rs "*"
    | lines
    | where { |l| $l =~ '^\[' }
    | str join "\n"
    | fzf --nth=2 --multi --header="TAB=select, ENTER=install" --preview="xbps-query -m {2}"
    | lines
    | each { |l|
        # field 2 is "pkgname-version_revision", xbps-query -R accepts this fine
        $l | split row ' ' | get 1
      }
  )

  if ($pkgs | is-not-empty) {
    sudo xbps-install -S ...($pkgs)
  }
}


def remove-package [] {
  let pkgs = (
    xbps-query -Rs "*"
    | lines
    | where { |l| $l =~ '^\[' }
    | str join "\n"
    | fzf --nth=2 --multi --header="TAB=select, ENTER=install" --preview="xbps-query -m {2}"
    | lines
    | each { |l|
        # field 2 is "pkgname-version_revision", xbps-query -R accepts this fine
        $l | split row ' ' | get 1
      }
  )

  if ($pkgs | is-not-empty) {
    sudo xbps-remove -R ...($pkgs)
  }
}

def edit [] {
  nvim (fzfile)
}

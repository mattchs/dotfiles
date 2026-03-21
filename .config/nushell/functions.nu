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
  fd --type f . | fzf
}

def fzpkg-install [] {
  let pkgs = (
    xbps-query -Rs "*"
    | fzf --multi --header="TAB=select, ENTER=install" --preview="xbps-query -R {2}"
    | lines
    | each { |l| $l | parse -r '\[\*?\]\s+(\S+)' | get -o 0.capture0 }
    | flatten
  )

  if ($pkgs | is-not-empty) {
    sudo xbps-install -S ...($pkgs)
  }
}

def fzpkg-remove [] {
  let pkgs = (
    xbps-query -l
    | fzf --multi --header="TAB=select, ENTER=remove" --preview="xbps-query {2}"
    | lines
    | each { |l| $l | parse -r '\S+\s+(\S+)' | get -o 0.capture0 }
    | flatten
  )

  if ($pkgs | is-not-empty) {
    sudo xbps-remove -R ...($pkgs)
  }
}

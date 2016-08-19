# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias ..="cd .."
alias ...="cd ../.."

alias sudo='sudo '

alias ec='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c -n'
alias et='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -n'

alias history='fc -l 1'
alias h='fc -l 1'

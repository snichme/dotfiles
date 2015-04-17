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

# alias emacs-server='~/Applications/Emacs.app/Contents/MacOS/Emacs --daemon'
# alias emacs='~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'
# alias emacs-gui='~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c'

alias emacs='~/Applications/Emacs.app/Contents/MacOS/Emacs'
alias emacsclient='~/Applications/Emacs.app/Contents/MacOS/bin/emacsclient'

# `shellswitch [bash|zsh|fish]`
function shellswitch
    chsh -s (brew --prefix)/bin/$argv
end

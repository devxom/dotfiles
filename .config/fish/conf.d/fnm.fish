if not contains $HOME/.local/share/fnm/ $PATH
    fish_add_path -a $HOME/.local/share/fnm/
end

fnm env --use-on-cd | source

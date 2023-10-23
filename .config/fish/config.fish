# I've noticed this file gets called 3 times. Looks like one is from pureprompt.
# todo, investigate later.
# status stack-trace

# set fish_trace 1

# for things not checked into git..
if test -e "$HOME/.extra.fish"
    source ~/.extra.fish
end

# Git prompt status
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showupstream auto

set -g fish_pager_color_completion normal
set -g fish_pager_color_description 555 yellow
set -g fish_pager_color_prefix cyan
set -g fish_pager_color_progress cyan

source ~/.config/fish/path.fish
source ~/.config/fish/aliases.fish
# fzf should be populated via `fd` which is the fastest file/dir finder. (respects gitignore, etc)
# note.. `fd` seems faster than `ag`.. but if i wanted to use `ag` this is good: command ag --files-with-matches --filename-pattern ""
# fd > 8.1 got slower. https://github.com/sharkdp/fd/issues/1131
#    so.. here's the install for the last fast one: CARGO_NET_GIT_FETCH_WITH_CLI=true cargo install --vers 8.1.1 fd-find
# To do a fzf including hidden/ignord files.. 'fd --unrestricted'
set -gx FZF_DEFAULT_COMMAND fd
set -gx FZF_CTRL_T_COMMAND fd
set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {} 2>/dev/null || tree -C {}'"

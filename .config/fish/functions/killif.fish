function killf
    if ps -ef | sed 1d | fzf -m | awk '{print $2}' >$TMPDIR/fzf.result
        kill -9 (cat $TMPDIR/fzf.result)
    end
end

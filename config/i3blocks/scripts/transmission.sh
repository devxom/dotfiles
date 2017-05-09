
#!/usr/bin/bash

count=$(echo $(transmission-remote localhost -l | wc -l) - 2 | bc)
if test $count -gt 0
then
    stats=$(transmission-remote localhost -l | tail -n 1 | column -t)
    down=$(echo $stats | cut -d " " -f 5 | cut -d '.' -f 1)
    up=$(echo $stats | cut -d " " -f 4 | cut -d '.' -f 1)
    if $(transmission-remote localhost -si | grep 'Enabled turtle' > /dev/null)
    then
        echo "$count ‒ $down / $up (turtle)"
    else
        echo "$count ‒ $down / $up"
    fi
fi

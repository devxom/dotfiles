# requires Paul Irish excellent `npm install -g statikk`
function server -d 'Start a HTTP server in the current dir, optionally specifying the port'
    # arg can either be port number or extra args to statikk
    if test $argv[1]
        if string match -qr '^-?[0-9]+(\.?[0-9]*)?$' -- "$argv[1]"
            echo $argv[1] is a number
            set port $argv[1]
            statikk --open --port "$port"
        else
            echo "not a number"
            statikk --open $argv[1]
        end
    else
        statikk --open
    end
end

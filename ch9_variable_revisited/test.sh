arg_read () {
    varname=$1
    eval read $varname
}

echo; echo -n "type your name: "
arg_read your_name

echo "your name is $your_name"

timestamp(){
    date +%s%N
}

# format an xml file, rewrites input file
format_xml(){
    cat $1 | xmllint --format --output $1 -
}

# expand all tabs to 4 spaces
no_tabs(){
    find . -name $1 ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

# use a sed expression to find and replace text in all files (recursive) in a given path
find_replace(){
    find . -type f -path "$1" -exec sed -i.backup "$2" {} \;
}

# execute git pull origin master in all subdirectories 1 level down 
git_all(){
    find . -mindepth 1 -maxdepth 1 -type d -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
}

# highlight text
highlight() { e="$1"; shift; grep --color=always -Eih "$e|$" "$@"; }

# grep all the history!
histgrep() { grep "$1" "$HISTFILE"; }

# grep process table
psgrep() { psc |grep -v grep |grep -i --color=auto "$@"; }

pspid() { ps xao pid,args |grep -v grep |grep -i "$@" |awk '{print $1}'; }

hello(){
    echo "HELLO WORLD!"
}

timestamp(){
    date +%s%N
}

# format an xml file, rewrites input file
format_xml(){
    cat $1 | xmllint --format --output $1 -
}

dock(){
    /usr/bin/xrandr --output eDP1 --auto --left-of DP2-2
    /usr/bin/xrandr --output DP2-1 --right-of DP2-2
    /usr/bin/xrandr --output DP2-2 --primary
}

dock_fix(){
    /usr/bin/xrandr --output DP2-1 --off && /usr/bin/xrandr --output DP2-2 --off
    /usr/bin/xrandr --output DP2-1 --auto && /usr/bin/xrandr --output DP2-2 --auto
    dock
}

undock(){
    /usr/bin/xrandr --output eDP1 --auto
}

# expand all tabs to 4 spaces
no_tabs(){
    find . -name $1 ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

java8(){
    export JAVA_HOME="/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-15.b17.fc23.x86_64"
    sudo update-alternatives --set java /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-15.b17.fc23.x86_64/jre/bin/java
    export PATH=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.65-15.b17.fc23.x86_64/bin:`echo ${PATH} | awk -v RS=: -v ORS=: '/jdk/ {next} {print}'`
}

java7(){
    export JAVA_HOME="/usr/java/jdk1.7.0_71"
    sudo update-alternatives --set java /usr/java/jdk1.7.0_71/bin/java
    export PATH=/usr/java/jdk1.7.0_71/bin:`echo ${PATH} | awk -v RS=: -v ORS=: '/jdk/ {next} {print}'`
}

java6(){
    export JAVA_HOME="/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64"
    sudo update-alternatives --set java /usr/lib/jvm/jre-1.6.0-openjdk.x86_64/bin/java
    export PATH=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/bin:`echo ${PATH} | awk -v RS=: -v ORS=: '/jdk/ {next} {print}'`
}

# highlight text
highlight() { e="$1"; shift; grep --color=always -Eih "$e|$" "$@"; }

# grep all the history!
histgrep() { grep "$1" "$HISTFILE"; }

# grep process table
psgrep() { psc |grep -v grep |grep -i --color=auto "$@"; }

pspid() { ps xao pid,args |grep -v grep |grep -i "$@" |awk '{print $1}'; }

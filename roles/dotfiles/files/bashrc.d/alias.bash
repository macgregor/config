export GRADLE_HOME=/usr/share/gradle-2.11
export JAVA_HOME=/usr/lib/jvm/java
export DROPBOX_ENCFS_ENCRYPTED_DIR={{dropbox_encfs_encrypted_dir}} 
export DROPBOX_ENCFS_UNENCRYPTED_DIR={{dropbox_encfs_unencrypted_dir}}

export PATH=$GRADLE_HOME/bin:$PATH

# trick to make aliases available when using sudo
alias sudo='sudo '

alias vi='vim'
alias ci='vim'

alias build_project="mvn clean install -DskipTests"
alias test_project="mvn test -fae"
alias bat='pygmentize -g'
alias eclipse='nohup /usr/share/eclipse/eclipse &>/dev/null &'
alias unmount_dropbox_encrypted='fusermount -u $DROPBOX_ENCFS_UNENCRYPTED_DIR'
alias mount_dropbox_encrypted='encfs --idle=15 $DROPBOX_ENCFS_ENCRYPTED_DIR $DROPBOX_ENCFS_UNENCRYPTED_DIR'

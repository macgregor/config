#!/usr/bin/expect -f

set encrypted_dir [lindex $argv 0]
set unencrypted_dir [lindex $argv 1]
set pass [lindex $argv 2]

spawn encfs $encrypted_dir $unencrypted_dir

expect "?> "
send "p\r"

expect "New Encfs Password: "
send "$pass\r"

expect "Verify Encfs Password: "
send "$pass\r"

expect eof

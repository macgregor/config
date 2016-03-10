#!/usr/bin/expect -f

set encrypted_dir [lindex $argv 0]
set unencrypted_dir [lindex $argv 1]
set pass [lindex $argv 2]

spawn encfs $encrypted_dir $unencrypted_dir

expect "?> "
send "x\r"

expect "Enter the number corresponding to your choice: "
send "1\r"

expect "Selected key size: "
send "256\r"

expect "filesystem block size: "
send "1024\r"

expect "Enter the number corresponding to your choice: "
send "3\r"

expect "Any response that does not begin with 'n' will mean Yes: "
send "no\r"

expect "Any response that does not begin with 'n' will mean Yes: "
send "no\r"

expect "Any response that does not begin with 'n' will mean Yes: "
send "no\r"

expect "Select a number of bytes, from 0 (no random bytes) to 8: "
send "0\r"

expect "Any response that does not begin with 'n' will mean Yes: "
send "yes\r"

expect "New Encfs Password: "
send "$pass\r"

expect "Verify Encfs Password: "
send "$pass\r"

expect eof

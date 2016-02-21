#! /bin/bash

pub_key="$(cat ~/.ssh/id_rsa.pub)"

data='{"title": "'$3'","key": "'$pub_key'"}'

response=$(curl -sL -w "%{http_code}" --user "$1:$2" --request POST --data "$data" https://api.github.com/user/keys -o /dev/null)

exit $response




#!/bin/bash

make

function assert() {
    expected=$1
    actual=$(echo "$2" | ./main)
    if [ "${expected}" != "${actual}" ]; then
        echo "input is ${2}"
        echo "expected: ${expected}, but actual: ${actual}"
        exit 1
    fi
}

expected1=$(cat <<EOF
009
010
011
EOF
)

input1="3 9 11"

expected2=$(cat <<EOF
00
01
02
03
EOF
)

input2="2 0 3"

assert "$expected1" "$input1"
assert "$expected2" "$input2"

echo 'All test are passed!!' 

make clean

function assert() {
    expected=$1
    actual=$(echo "$2" | ./main)
    if [ "${expected}" != "${actual}" ]; then
        echo "input is ${2}"
        echo "expected: ${expected}, but actual: ${actual}"
        exit 1
    fi
}

assert "Valid" "abc123"
assert "Valid" "abcdefghijklmnopqrstuvwxyz1234"
assert "Invalid" "aaabbb"
assert "Invalid" "abcdef"
assert "Invalid" "123456"
assert "Invalid" "a1bcd"

echo "All tests are green."
exit 0


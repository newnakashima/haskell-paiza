./main < case1.txt > test_result.txt
expected="4
1"
if [ "$(cat test_result.txt)" != "$expected" ]; then
    echo "failed"
    echo "expected: $expected"
    echo "actual: $(cat test_result.txt)"
    exit 1
fi

./main < case2.txt > test_result.txt
expected="2
0"
if [ "$(cat test_result.txt)" != "$expected" ]; then
    echo "failed"
    echo "expected: $expected"
    echo "actual: $(cat test_result.txt)"
    exit 1
fi

echo "All tests are green!"
exit 0

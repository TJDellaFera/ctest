#!/bin/bash
# This script assumes the test files are in ./tests/ and are named with the following convention:
# test input: {file_name}
# expected output: {file_name}.a

file_to_test=$1
answer_pattern=".*\.a"
err_spacing="    "

for f in $( ls ./tests/ ); do
    if [[ ! $f =~ $answer_pattern ]] ; then
        result=$( cat ./tests/$f | python $file_to_test )
        expected_result=$( cat ./tests/$f.a )
        if [[ $result = $expected_result ]]; then
            echo TEST \#$f: PASSED
        else
            echo TEST \#$f: FAILED
            echo "$err_spacing" Test Input: $( cat ./tests/$f )
            echo "$err_spacing" Result: $result
            echo "$err_spacing" Expected Result: $expected_result
        fi
    fi
done
#!/bin/ruby

require 'json'
require 'stringio'

# Complete the repeatedString function below.
def repeatedString(s, n)
    # First approach times out
    # s = s * ((n/s.length)+1)
    # p s[0..n-1].count('a')
    a_count = s.count('a')
    times_to_repeat = ((n/s.length))
    num_a_in_string = a_count * times_to_repeat
    leftover = (n%(s.length))
    num_a_in_string += s[0..leftover-1].count('a') if leftover >= 1
    p num_a_in_string
end

# Tests
# repeatedString('aba', 10)
# repeatedString('a', 1000000000000)

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

n = gets.to_i

result = repeatedString s, n

fptr.write result
fptr.write "\n"

fptr.close()

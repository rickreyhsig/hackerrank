#!/bin/ruby

require 'json'
require 'stringio'

# Complete the countingValleys function below.
def countingValleys(n, s)
    valleysNum = 0
    level = 0
    s.each_char do | step |
        step == "D" ? level -= 1 : level += 1
        valleysNum += 1 if (level == 0 && step == "U")
    end
    p valleysNum
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

s = gets.to_s.rstrip

result = countingValleys n, s

fptr.write result
fptr.write "\n"

fptr.close()

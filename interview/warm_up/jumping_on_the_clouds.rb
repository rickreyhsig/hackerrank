# https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=warmup
#!/bin/ruby

require 'json'
require 'stringio'

# Complete the jumpingOnClouds function below.
def jumpingOnClouds(c)
    jumps = 0; index = 0
    while index < (c.length - 1)
      if c[index + 2] == 0
        index += 2; jumps += 1
      else
        index += 1; jumps += 1
      end
    end
    jumps
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.to_i

c = gets.rstrip.split(' ').map(&:to_i)

result = jumpingOnClouds c

fptr.write result
fptr.write "\n"

fptr.close()

# Tests
p jumpingOnClouds([0, 0, 1, 0, 0, 1, 0])
p jumpingOnClouds([0, 0, 0, 0, 1, 0])
p jumpingOnClouds([0, 0, 0, 1, 0, 0])

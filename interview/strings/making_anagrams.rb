#!/bin/ruby

require 'json'
require 'stringio'

# Complete the makeAnagram function below.
def makeAnagram(a, b)
    # Remove characters present in both strings
    a.each_char do |chr|
        if b.include?(chr)
            a.sub!(chr,''); b.sub!(chr,'')
        end
    end
    b.each_char do |chr|
        if a.include?(chr)
            a.sub!(chr,''); bsub!(chr,'')
        end
    end
    # Return the length of both strings combined
    return (a+b).length
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.to_s.rstrip

b = gets.to_s.rstrip

res = makeAnagram a, b

fptr.write res
fptr.write "\n"

fptr.close()

=begin

def makeAnagram(a, b)
    a.each_char do |chr|
        if b.include?(chr)
            a.sub!(chr,''); b.sub!(chr,'')
        end
    end
    b.each_char do |chr|
        if a.include?(chr)
            a.sub!(chr,''); bsub!(chr,'')
        end
    end
    return (a+b).length
end

a = 'cde'
b = 'abc'
makeAnagram(a, b)
=> 4

a = 'showman'
b = 'woman'
makeAnagram(a, b)
=> 2

a = 'fcrxzwscanmligyxyvym'
b = 'jxwtrhvujlmrpdoqbisbwhmgpmeoke'
makeAnagram(a, b)
=> 30

a2 = a.chars.sort.join
b2 = b.chars.sort.join

a2 = "accfgilmmnrsvwxxyyyz"
b2 = "bbdeeghhijjklmmmooppqrrstuvwwx"

a3 = "accfnxyyyz"
b3 = "bbdeehhjjkmooppqrtuw"
=end

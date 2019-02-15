# https://www.hackerrank.com/challenges/staircase/problem

# Complete the staircase function below.
def staircase(n)
    n.times do |i|
        (n-1-i).times { |i| print  ' '}
        (i+1).times { |i| print  '#'}
        puts
    end
end

staircase(1)
p '----'
staircase(2)
p '----'
staircase(4)

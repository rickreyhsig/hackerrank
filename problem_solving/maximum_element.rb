# https://www.hackerrank.com/challenges/maximum-element/problem
stack = Array.new
$stdin.each_line do |l|
    args = l.strip.split(' ')
    stack << args[1].to_i if (args.length > 1 && args[0] == '1')
    stack.pop if args[0] == '2'
    p stack.max if args[0] == '3'
end

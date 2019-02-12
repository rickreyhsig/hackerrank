def plusMinus(arr)
    l = arr.length
    puts arr.count {|n| n > 0} / l.to_f
    puts arr.count {|n| n < 0} / l.to_f
    puts arr.count {|n| n == 0} / l.to_f
end

p plusMinus([-4,3,-9,0,4,1])

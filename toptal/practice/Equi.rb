def equilibrium(a)
    a.each_with_index do |num, i|
        return i+1 if left_side(a,i) == right_side(a,i)
        break if i == a.length-2
    end
    return -1 # No match found
end

def right_side(a, i)
    return a[i+2,a.length].inject(0){ |sum,x| sum + x }
end

def left_side(a, i)
  return a[0,i+1].inject(0){ |sum,x| sum + x }
end

p equilibrium([-1,3,-4,5,1,-6,2,1])

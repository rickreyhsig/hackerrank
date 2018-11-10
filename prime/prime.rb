# Your code here
class Prime
  def prime? n
    divisible_cnt = 0
    dup_n = n
    while dup_n > 0
      #p n
      #p dup_n
      #p '---'
      divisible_cnt += 1 if n % dup_n == 0
      dup_n -= 1
    end
    #p "divisible_cnt: #{divisible_cnt}"
    return true if divisible_cnt == 2
    return false
  end
end

prime = Prime.new
p prime.prime? 3
p prime.prime? 17
p prime.prime? 22

#p prime.prime? 4
#p prime.prime? 5

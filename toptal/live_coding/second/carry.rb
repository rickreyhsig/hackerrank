def numberOfCarryOperations(n1, n2)
  carries = 0
  transfer = 0
  n1_a = n1.to_s.split('')
  n2_a = n2.to_s.split('')

  if n1_a.count >= n2_a.count
    greater = n1_a
    lesser = n2_a
  else
    greater = n2_a
    lesser = n1_a
  end
  (greater.count-lesser.count).times { lesser.unshift('0') }
  lesser = lesser.reverse

  greater.reverse_each.with_index do |n, i|
    #p "#{n.to_i}:#{lesser[i].to_i}:#{transfer}"
    if (n.to_i+lesser[i].to_i+transfer) > 9
      carries += 1
      transfer = 1
    else
      transfer = 0
    end
  end

  p carries
end

numberOfCarryOperations(65, 55) # 2
numberOfCarryOperations(655, 55) # 2
numberOfCarryOperations(785, 326) # 3
# -----
numberOfCarryOperations(123, 456) # 0
numberOfCarryOperations(555, 555) # 3
numberOfCarryOperations(900, 11) # 0
numberOfCarryOperations(145, 55) # 2
numberOfCarryOperations(0, 0) # 0
numberOfCarryOperations(1, 99999) # 5
numberOfCarryOperations(999045, 1055) # 5
numberOfCarryOperations(101, 809) # 1
numberOfCarryOperations(189, 209) # 1



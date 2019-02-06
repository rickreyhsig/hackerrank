# https://www.hackerrank.com/challenges/new-year-chaos/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays

class Array
  def swap(i,j)
    self[i], self[j] = self[j], self[i]
  end
end

# Try a bubble sort implementation to see if timeout no longer occurs
class NewYearChaos
    def minimumBribes(q)
        initial = *(1..q.length)
        num_swaps = Hash.new
        initial.map{ |x| num_swaps[x] = 0 }
        swaps = 0
        initial.each do |i|
            return swaps if q == initial
            while q[i-1] != i
                j = q[q.index(i)-1]
                q.swap(q.index(i),q.index(i)-1)
                num_swaps[j] += 1
                swaps += 1
                if num_swaps.values.include?(3)
                    return 'Too chaotic'
                end
            end
        end
        return swaps
    end
end

#class NewYearChaos
#    def minimumBribes(q)
#        initial = *(1..q.length)
#        num_swaps = Hash.new
#        initial.map{ |x| num_swaps[x] = 0 }
#        swaps = 0
#        p q
#        initial.each do |i|
#            while q[i-1] != i
#                #j = q[i-1]
#                j = q[q.index(i)-1]
#                p "#{i}:#{q[q.index(i)-1]}"
#                q.swap(q.index(i),q.index(i)-1)
#                num_swaps[j] += 1
#                swaps += 1
#                p q
#                p num_swaps
#                if num_swaps.values.include?(3)
#                    return 'Too chaotic'
#                end
#            end
#        end
#        p num_swaps
#        p swaps
#        return swaps
#    end
#end

#NewYearChaos.new.minimumBribes([2,1,5,3,4])
#NewYearChaos.new.minimumBribes([2,5,1,3,4])
#NewYearChaos.new.minimumBribes([1,2,5,3,4,7,8,6])
#NewYearChaos.new.minimumBribes([1,2,5,3,7,8,6,4])


=begin
#!/bin/ruby

require 'json'
require 'stringio'

class Array
  def swap(i,j)
    self[i], self[j] = self[j], self[i]
  end
end

# Complete the minimumBribes function below.
    def minimumBribes(q)
        initial = *(1..q.length)
        num_swaps = Hash.new
        initial.map{ |x| num_swaps[x] = 0 }
        swaps = 0
        initial.each do |i|
            if q == initial
                p swaps
                return
            end
            while q[i-1] != i
                j = q[q.index(i)-1]
                q.swap(q.index(i),q.index(i)-1)
                num_swaps[j] += 1
                swaps += 1
                if num_swaps.values.include?(3)
                    puts 'Too chaotic'
                    return
                end
            end
        end
        p swaps
    end

t = gets.to_i

t.times do |t_itr|
    n = gets.to_i

    q = gets.rstrip.split(' ').map(&:to_i)

    minimumBribes q
end

=end

# https://www.hackerrank.com/challenges/common-child/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings
#class CommonChild
#    def common_child(s1, s2)
#        t1 = ''
#        t2 = ''
#        s2.each_char.with_index do |ch, i|
#            if s1.include? (ch)
#                t1 << ch
#                t2 << ch
#                s1.slice!(0,s1.index(ch)+1)
#                s2.slice!(i)
#            end
#        end
#        return t1.length
#    end
#end

class CommonChild
    def common_child(s1, s2)
      m = Array.new(s1.size + 1, 0)
      for i in 1..s1.size
        new = Array.new(1, 0)
        for j in 1..s2.size
          new.push s1[i-1] == s2[j-1] ? m[j-1] + 1 : [new[j-1], m[j]].max
        end
        m = new
      end
      m.last
    end
end

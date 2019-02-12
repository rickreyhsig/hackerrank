# https://www.hackerrank.com/challenges/common-child/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings
class CommonChild
    def common_child(s1, s2)
        t1 = ''
        t2 = ''
        s2.each_char.with_index do |ch, i|
            if s1.include? (ch)
                t1 << ch
                t2 << ch
                s1.slice!(0,s1.index(ch)+1)
                s2.slice!(i)
            end
        end
        p t1.length

        s1.each_char.with_index do |ch, i|
            if s2.include? (ch)
                t1 << ch
                t2 << ch
                s2.slice!(0,s2.index(ch)+1)
                s2.slice!(i)
            end
        end
        p t2.length


        return t1.length
    end
end

=begin
class CommonChild
#    def common_child(s1, s2)
#        cnt = 0
#        t1 = ''
#        t2 = ''
#        s2.each_char.with_index do |ch, i|
#            #p ch
#            #p "#{s1.count(ch)}:#{s2.count(ch)}"
#            if s1.include? (ch)
#                cnt += 1
#                t1 << ch
#                t2 << ch
#                #s1.slice!(0,s1.index(ch)+1)
#                #s2.slice!(i)
#            end
#            p "s1:#{s1}-s2:#{s2}"
#            #p "t1:#{t1}-t2:#{t2}"
#        end
#        p "cnt: #{cnt}"
#        return t1.length
#    end
    def common_child(s1, s2)
        p s1
        p s2
        cnt = 0
        p s1.length
        s2.each_char.with_index do |ch, i|

            s1.gsub(ch, '') unless s2.include? ch
            s2.gsub(ch, '') unless s1.include? ch

            p "#{s1.count(ch)}:#{s2.count(ch)}"
            if s1.count(ch) > s2.count(ch)
                a = s1.count(ch) - s2.count(ch)
                a.times { |i| s1.slice!(ch) }
            elsif s2.count(ch) > s1.count(ch)
                b = s2.count(ch) - s1.count(ch)
                b.times { |i| s2.slice!(ch) }
            end

            if s1.include? (ch)
                cnt += 1

                #t1 << ch
                #t2 << ch
                #s1.slice!(0,s1.index(ch)+1)
                #s2.slice!(i)
            end
        end
        p s1
        p s2
        p s1.length
        p "cnt: #{cnt}"
        return s2.length
    end
end
=end

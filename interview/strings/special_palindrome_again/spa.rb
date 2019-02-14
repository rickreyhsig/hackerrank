# https://www.hackerrank.com/challenges/special-palindrome-again/problem

class SpecialPalindrome
    def is_spc_palindrome(s)
        return true if s.split('').uniq.length == 1
        return false if s.length.even?
        tmp = s
        tmp.slice!(tmp.length/2)
        return true if (tmp.split('').uniq.length == 1)
        return false
    end

    def substrCount(n, s)
        spc_palindromes = Array.new
        s.each_char.with_index do |ch, i|
            s[i..s.length-1].split('').reverse_each.with_index do |chr, k|
                j = s.length-1-k
                #p "#{s[i..j]}:#{s[i..j].reverse}"
                #p "#{s[i..j]}:#{is_spc_palindrome(s[i..j])}"
                spc_palindromes << s[i..j] if is_spc_palindrome(s[i..j])
            end
            #p '---'
        end
        #p spc_palindromes
        return spc_palindromes.length
    end
end

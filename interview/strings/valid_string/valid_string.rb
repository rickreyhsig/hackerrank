class ValidString
    def validString(s)
        s_hash = Hash.new
        s.each_char do |ch|
            s_hash[ch] = s_hash[ch].nil? ? 1 : s_hash[ch]+1
        end
        vals = s_hash.values
        vu = vals.uniq
        return 'YES' if vu.length == 1
        return 'NO' if vu.length > 2
        if vu.length == 2
            return 'YES' if vu[0] == 1 && vals.count(vu[0]) == 1
            return 'YES' if vu[1] == 1 && vals.count(vu[1]) == 1
            return 'NO' if (vals.count(vu[0]) > 1 && vals.count(vu[1]) > 1)
            return 'NO' if (vu[0] - vu[1]).abs > 1
        end
        return 'YES'
    end
end

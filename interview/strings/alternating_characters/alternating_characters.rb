class AlternatingCharacters
    def alternatingCharacters(s)
        deletions = 0
        s.each_char.with_index do |ch, i|
            deletions += 1 if ch == s[i+1]
        end
        return deletions
    end
end

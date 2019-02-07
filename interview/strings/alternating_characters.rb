#def alternatingCharacters(s)
#    deletions = 0
#    s.each_char.with_index do |ch, i|
#        #p "#{ch}:#{s[i+1]}:#{i}"
#        deletions += 1 if ch == s[i+1]
#    end
#    return deletions
#end

def alternatingCharacters(s)
    deletions = 0
    s.each_char.with_index do |ch, i|
        deletions += 1 if ch == s[i+1]
    end
    return deletions
end

p alternatingCharacters('AAAA')
p alternatingCharacters('BBBBB')
p alternatingCharacters('ABABABAB')
p alternatingCharacters('BABABA')
p alternatingCharacters('AAABBB')

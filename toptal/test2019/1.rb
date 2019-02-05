class String
  def swap(i,j)
      self[i], self[j] = self[j], self[i]
  end

  def replace(chr, i)
      tmp = self.dup
      tmp[i] = chr
      return tmp
  end
end

def solution(s, t)
    return "EQUAL" if s == t
    res = switchWithInsert(s,t)
    return "INSERT " + res unless res.nil?
    res = switchWithReplace(s, t)
    return "REPLACE " + res unless res.nil?
    res = switchWithSwap(s, t)
    return "SWAP " + res unless res.nil?
    return "IMPOSSIBLE"
end

def switchWithInsert(s,t)
    return nil if ((s.length - t.length).abs != 1)
    s_tmp = s.dup
    t.each_char.with_index do |chr, i|
        return chr if s.insert(i,chr) == t
        s = s_tmp.dup # revert back to normal
    end
    return nil
end

def switchWithReplace(s,t)
    return nil if (s.length != t.length)
    s.each_char.with_index do |chr, i|
        return chr + " " + t[i] if s.replace(t[i], i) == t
    end
    return nil
end

def switchWithSwap(s, t)
    return nil if (s.length != t.length)
    s.each_char.with_index do |chr, i|
        s.swap(i,i+1)
        return s[i+1] + " " + s[i] if (t == s)
        s.swap(i,i+1) # revert back to normal
    end
    return nil
end

p solution('nice', 'niece')
p solution('test', 'tent')
p solution('form', 'from')
p solution('even', 'even')
p solution('o', 'odd')



=begin
# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

class String
  def swap(i,j)
    self[i], self[j] = self[j], self[i]
  end

  def replace(chr, i)
      tmp = self.dup
      tmp[i] = chr
      return tmp
  end
end

def switchWithInsert(s,t)
    return nil if ((s.length - t.length).abs != 1)
    s_tmp = s.dup
    t.each_char.with_index do |chr, i|
        return chr if s.insert(i,chr) == t
        s = s_tmp.dup
    end
    return nil
end

def switchWithSwap(s, t)
    return nil if (s.length != t.length)
    s.each_char.with_index do |chr, i|
        s.swap(i,i+1)
        return s[i+1] + " " + s[i] if (t == s)
        s.swap(i,i+1) # revert back to normal
    end
    return nil
end

def switchWithReplace(s,t)
    return nil if (s.length != t.length)
    s.each_char.with_index do |chr, i|
        return chr + " " + t[i] if s.replace(t[i], i) == t
    end
    return nil
end

def solution(s, t)
    return "EQUAL" if s == t
    res = switchWithInsert(s,t)
    return "INSERT " + res unless res.nil?
    res = switchWithReplace(s, t)
    return "REPLACE " + res unless res.nil?
    res = switchWithSwap(s, t)
    return "SWAP " + res unless res.nil?
    return "IMPOSSIBLE"
end



Compilation successful.

Example test:    ('nice', 'niece')
OK

Example test:    ('test', 'tent')
OK

Example test:    ('form', 'from')
OK

Example test:    ('o', 'odd')
OK

Your test case:  ['hey', 'heya']
Returned value: 'INSERT a'

Your test case:  ['heyd', 'heya']
Returned value: 'REPLACE d a'

Your test case:  ['heya', 'heay']
Returned value: 'SWAP y a'

Your test case:  ['hey', 'hey']
Returned value: 'EQUAL'

Your test case:  ['hey', 'hey man']
Returned value: 'IMPOSSIBLE' 

=end

=begin
def solution(s)
    num_removed = 0
    s.each_char.with_index do |ch, i|
        #p "#{ch}:#{s[i+1]}"
        #p ch > s[i+1] if i < s.length-1
        if i < s.length-1 && ch > s[i+1]
            num_removed += 1
        end
    end
    return num_removed
end
=end
def solution(s)
    num_removed = 0
    s.each_char.with_index do |ch, i|
        if i < s.length-1 && ch > s[i+1]
            num_removed += 1
        end
    end
    return num_removed
end

p solution('banana')

=begin
Compilation successful.

Example test:    'banana'
OK

Your test case:  ['aabdcea']
Returned value: 2

Your test case:  ['aabcdefa']
Returned value: 1

Your test case:  ['edcba']
Returned value: 4

Your code is syntactically correct and works properly on the example test.
=end

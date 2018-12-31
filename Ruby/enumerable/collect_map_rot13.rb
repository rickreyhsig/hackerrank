def rot13(secret_messages)
  secret_messages.map { |msg| msg.chars.map{ |c| map_char_rot13(c) }.join }
end

def map_char_rot13(ch)
    if (/[[:upper:]]/.match(ch))
        13.times { ch == 'Z' ? ch = 'A' : ch = ch.next }
    elsif (/[[:lower:]]/.match(ch))
        13.times { ch == 'z' ? ch = 'a' : ch = ch.next }
    end
    return ch
end


=begin

In this challenge, your task is to write a method which takes an array of strings
(containing secret enemy message bits!) and decodes its elements using ROT13 cipher system;
returning an array containing the final messages.

For example, this is how ROT13 algorithm works,

Original text:

Why did the chicken cross the road?
Gb trg gb gur bgure fvqr!

On application of ROT13,

Jul qvq gur puvpxra pebff gur ebnq?
To get to the other side!

=end

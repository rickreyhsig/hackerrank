def count_multibyte_char(str)
    cnt = 0
    str.each_char { |x| cnt += 1 if x.bytesize > 1 }
    return cnt
end

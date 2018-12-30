def mask_article(str, arr)
    arr.each { |s| str.gsub!(s,strike(s)) }
    return str
end

def strike(str)
    "<strike>#{str}</strike>"
end

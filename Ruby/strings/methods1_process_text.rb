def process_text(arr)
    arr.map{ |s| s.gsub("\n", "").strip }.join(' ')
end

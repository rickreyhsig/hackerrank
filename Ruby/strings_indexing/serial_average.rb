def serial_average(str)
    arr = str.split('-')
    #avg = '%.2f' % ((arr[1].to_f+arr[2].to_f)/2)
    avg = ((arr[1].to_f+arr[2].to_f)/2).round(2)
    return "#{arr[0]}-#{avg}"
end

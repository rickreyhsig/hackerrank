# https://www.hackerrank.com/challenges/designer-pdf-viewer/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign

# Complete the designerPdfViewer function below.
def designerPdfViewer(h, word)
  heights = Array.new
  hsh = Hash.new
  ("a".."z").each_with_index { |letter, i| hsh[letter] = h[i] }
  word.each_char { |ch| heights << hsh[ch] }
  return heights.max * heights.count
end

p designerPdfViewer([1,3,1,3,1,4,1,3,2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5], 'abc')
p designerPdfViewer([1,3,1,3,1,4,1,3,2,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,7], 'zaba')


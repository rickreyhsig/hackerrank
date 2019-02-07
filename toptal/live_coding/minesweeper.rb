# https://sharetask.io/t/NNsDvSNmAVwO-HydgOc4i
# Transform 2D array with Moore values if == 'X'

def moore(arr, i, j)
    moore = 0
    if i-1 >= 0
        moore +=1 if j-1 >= 0 && arr[i-1][j-1] == "X"
        moore +=1 if arr[i-1][j] == "X"
        moore +=1 if j+1 <= arr[i-1].length-1 && arr[i-1][j+1] == "X"
    end

    moore +=1 if j-1 >= 0 && arr[i][j-1] == "X"
    moore +=1 if j+1 <= arr.length-1 && arr[i][j+1] == "X"

    if i+1 <= arr.length-1
        moore +=1 if j-1 >= 0 && arr[i+1][j-1] == "X"
        moore +=1 if arr[i+1][j] == "X"
        moore +=1 if j+1 <= arr[i+1].length-1 && arr[i+1][j+1] == "X"
    end

    return moore
end

def minesweeper(arr)
    arr.each_with_index do |sub, i|
        sub.each_char.with_index do |elem, j|
            arr[i][j] = moore(arr, i, j).to_s if elem == "O"
        end
    end
    arr.each { |elem| p elem}
end

minesweeper(["XOO", "OOO", "XXO"])

=begin
def moore(arr, i, j)
    moore = 0
    #p "Value: #{arr[i][j]}"

    if i-1 >= 0
        #p arr[i-1][j-1] if j-1 >= 0
        #p arr[i-1][j]
        #p arr[i-1][j+1] if j+1 <= arr[i-1].length-1

        moore +=1 if j-1 >= 0 && arr[i-1][j-1] == "X"
        moore +=1 if arr[i-1][j] == "X"
        moore +=1 if j+1 <= arr[i-1].length-1 && arr[i-1][j+1] == "X"
    end

    #p arr[i][j-1] if j-1 >= 0
    moore +=1 if j-1 >= 0 && arr[i][j-1] == "X"
    #p arr[i][j+1] if j+1 <= arr.length-1
    moore +=1 if j+1 <= arr.length-1 && arr[i][j+1] == "X"

    if i+1 <= arr.length-1
        #p arr[i+1][j-1] if j-1 >= 0
        moore +=1 if j-1 >= 0 && arr[i+1][j-1] == "X"

        #p arr[i+1][j]
        moore +=1 if arr[i+1][j] == "X"

        #p arr[i+1][j+1] if j+1 <= arr[i+1].length-1
        moore +=1 if j+1 <= arr[i+1].length-1 && arr[i+1][j+1] == "X"
    end

    return moore
end

def minesweeper(arr)
    #p arr
    arr.each_with_index do |sub, i|
        #p sub
        sub.each_char.with_index do |elem, j|
            #p elem
            #p "#{i}:#{j}"

            #p moore(arr, i, j) if elem == "O"
            arr[i][j] = moore(arr, i, j).to_s if elem == "O"
        end
    end
    arr.each { |elem| p elem}
end

#p moore(["XOO", "OOO", "XXO"], 0, 0)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 0, 1)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 0, 2)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 1, 0)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 1, 1)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 1, 2)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 2, 0)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 2, 1)
#p '---'
#p moore(["XOO", "OOO", "XXO"], 2, 2)
#p '---'

minesweeper(["XOO", "OOO", "XXO"])
# XOO
# OOO
# XXO
=end

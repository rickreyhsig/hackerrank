# Monkey patch Array#swap method
class Array
  def swap(i,j)
    self[i], self[j] = self[j], self[i]
  end
end

# Complete the minimumSwaps function below.
def minimumSwaps(arr)
    num_swaps = 0
    index = 0
    min_index = 0
    #while arr.sort != arr
    while index < arr.length-1
        min_index = arr.index(arr[index..arr.length-1].min)
        #if arr[index] > arr[min_index]
        if arr[index] != index+1
            arr.swap(index,min_index)
            num_swaps += 1
        end
        index += 1
    end
    return num_swaps
end
minimumSwaps([7, 1, 3, 2, 4, 5, 6])
minimumSwaps([4,3,1,2])
minimumSwaps([2,3,4,1,5])

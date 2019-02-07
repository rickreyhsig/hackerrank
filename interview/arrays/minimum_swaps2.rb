# Monkey patch Array#swap method
class Array
  def swap(i,j)
    self[i], self[j] = self[j], self[i]
  end
end

def quicksort(array, from=0, to=nil)
    num_swaps = 0
    if to == nil
        # Sort the whole array, by default
        to = array.count - 1
    end

    if from >= to
        # Done sorting
        return
    end

    # Take a pivot value, at the far left
    pivot = array[from]

    # Min and Max pointers
    min = from
    max = to

    # Current free slot
    free = min

    while min < max
        if free == min # Evaluate array[max]
            if array[max] <= pivot # Smaller than pivot, must move
                array[free] = array[max]
                min += 1
                free = max
                num_swaps += 1
            else
                max -= 1
            end
        elsif free == max # Evaluate array[min]
            if array[min] >= pivot # Bigger than pivot, must move
                array[free] = array[min]
                max -= 1
                free = min
                num_swaps += 1
            else
                min += 1
            end
        else
            raise "Inconsistent state"
        end
    end

    array[free] = pivot
    num_swaps += 1

    quicksort array, from, free - 1
    quicksort array, free + 1, to
    return num_swaps
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

def minimumSwaps(arr)
    num_swaps = 0
    index = 0
    arr.each_with_index do |item, index|
        #p "index:#{index} arr[index]:#{arr[index]} item:#{item}"
        if arr[index] != index+1
            arr.swap(index,arr.index(index+1))
            num_swaps += 1
        end
    end
    return num_swaps
end
minimumSwaps([7, 1, 3, 2, 4, 5, 6])
minimumSwaps([4,3,1,2])
minimumSwaps([2,3,4,1,5])


# JS

Array.prototype.swap = function (i, j) {
    [this[i], this[j]] = [this[j], this[i]];
    return this;
}

// Complete the minimumSwaps function below.
function minimumSwaps(arr) {
    let num_swaps = 0;
    let index = 0;
    let min_index = 0;
    while (index < arr.length) {
        min_index = arr.indexOf(Math.min(...arr.slice(index,arr.length)))
        if (arr[index] > arr[min_index]) {
            arr.swap(index, min_index)
            num_swaps += 1
        }
        index += 1
        /*console.log(`index: ${index}`)
        console.log(`min_index: ${min_index}`)
        console.log(`num_swaps: ${num_swaps}`)
        console.log(`arr: ${arr}`)*/
    }
    return num_swaps
}
minimumSwaps([2,3,4,1,5])

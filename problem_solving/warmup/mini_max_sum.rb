# https://www.hackerrank.com/challenges/mini-max-sum/problem

# Complete the miniMaxSum function below.
def miniMaxSum(arr)
    tmp1 = arr.dup; tmp2 = arr.dup
    tmp1.delete_at(tmp1.find_index(tmp1.min))
    tmp2.delete_at(tmp2.find_index(tmp2.max))
    max_arr = tmp1
    min_arr = tmp2
    print min_arr.sum
    print ' '
    print max_arr.sum
end

miniMaxSum([1,3,5,7,9])
miniMaxSum([5,5,5,5,5])

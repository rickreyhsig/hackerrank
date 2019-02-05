def solution(a)
    tmp = a.delete_if{ |x| x <= 0}
    a.sort!.uniq!
    smallestPos = 1
    if a.empty? || a.first != 1
        return 1
    elsif a.last > a.length
        a.each_with_index do |x, i|
            if x != i+1
                smallestPos = i+1
                break
            end
        end
    else
        smallestPos = a.length+1
    end
    return smallestPos
end

p solution([1, 3, 6, 4, 1, 2])
p solution([1, 2, 3])
p solution([-1, -3])
p solution([4, 5, 6, 2])
p solution([7, 5, 6, 8, 1, 2])
p solution([*1..100].shuffle)
p solution([*102..200].shuffle)

=begin
MissingInteger

This is a demo task.

Write a function:

def solution(a)

that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

Given A = [1, 2, 3], the function should return 4.

Given A = [−1, −3], the function should return 1.

Write an efficient algorithm for the following assumptions:

N is an integer within the range [1..100,000];
each element of array A is an integer within the range [−1,000,000..1,000,000].


=end

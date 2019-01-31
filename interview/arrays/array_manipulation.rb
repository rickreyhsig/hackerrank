# https://www.hackerrank.com/challenges/crush/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign

# Complete the arrayManipulation function below.
def arrayManipulation(n, queries)
    arr = Array.new(n, 0)
    queries.each do |q|
        arr[q[0]-1..q[1]-1].each_with_index do |item, i|
            i_plus_offset = i + q[0]-1
            arr[i_plus_offset] = arr[i_plus_offset]+q[2]
        end
    end
    return arr.max
end

p arrayManipulation(5, [[1, 2, 100], [2, 5, 100], [3, 4, 100]])
p arrayManipulation(10, [[1, 5, 3], [4, 8, 7], [6, 9, 1]])

=begin
JS
https://codereview.stackexchange.com/questions/95755/algorithmic-crush-problem-hitting-timeout-errors
function arrayManipulation(n, queries) {
    let arr = new Array(2*n).fill(0); let max = 0;
    queries.forEach((item) => {
        arr[item[0]] += item[2];
        arr[item[1] + 1] -= item[2];
    });

    arr.reduce((prev, curr, idx) => {
        const sum = prev + curr;
        if (sum > max) {
            max = sum;
        }

        return sum;
    })
}

return max;
=end

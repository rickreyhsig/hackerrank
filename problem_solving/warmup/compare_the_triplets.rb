# https://www.hackerrank.com/challenges/compare-the-triplets/problem
def compareTriplets(a, b)
    score = [0,0]
    a.each_with_index do |elem, i|
        if a[i] > b[i]
            score[0] += 1
        elsif b[i] > a[i]
            score[1] += 1
        end
    end
    return score
end

p compareTriplets([5,6,7], [3,6,10])
p compareTriplets([17,28,30], [99,16,8])

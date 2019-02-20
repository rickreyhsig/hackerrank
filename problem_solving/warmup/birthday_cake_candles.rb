# https://www.hackerrank.com/challenges/birthday-cake-candles/problem

# Complete the birthdayCakeCandles function below.
def birthdayCakeCandles(ar)
  return ar.count(ar.max)
end

p birthdayCakeCandles([4,4,1,3])
p birthdayCakeCandles([2,3,1,3])
p birthdayCakeCandles([7,7,1,2,7,4,5])

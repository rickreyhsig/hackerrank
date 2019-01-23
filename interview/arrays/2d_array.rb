#!/bin/ruby

require 'json'
require 'stringio'

def get_hourglasses(array)
  all_hourglasses = Array.new

  # 0
  hourglasses = Array.new
  hourglasses << array[0][0] << array[0][1] << array[0][2]
  hourglasses <<                array[1][1]
  hourglasses << array[2][0] << array[2][1] << array[2][2]
  all_hourglasses << hourglasses

  # 1
  hourglasses = Array.new
  hourglasses << array[0][1] << array[0][2] << array[0][3]
  hourglasses <<                array[1][2]
  hourglasses << array[2][1] << array[2][2] << array[2][3]
  all_hourglasses << hourglasses

  # 2
  hourglasses = Array.new
  hourglasses << array[0][2] << array[0][3] << array[0][4]
  hourglasses <<                array[1][3]
  hourglasses << array[2][2] << array[2][3] << array[2][4]
  all_hourglasses << hourglasses

  # 3
  hourglasses = Array.new
  hourglasses << array[0][3] << array[0][4] << array[0][5]
  hourglasses <<                array[1][4]
  hourglasses << array[2][3] << array[2][4] << array[2][5]
  all_hourglasses << hourglasses

  # 4
  hourglasses = Array.new
  hourglasses << array[1][0] << array[1][1] << array[1][2]
  hourglasses <<                array[2][1]
  hourglasses << array[3][0] << array[3][1] << array[3][2]
  all_hourglasses << hourglasses

  # 5
  hourglasses = Array.new
  hourglasses << array[1][1] << array[1][2] << array[1][3]
  hourglasses <<                array[2][2]
  hourglasses << array[3][1] << array[3][2] << array[3][3]
  all_hourglasses << hourglasses

  # 6
  hourglasses = Array.new
  hourglasses << array[1][2] << array[1][3] << array[1][4]
  hourglasses <<                array[2][3]
  hourglasses << array[3][2] << array[3][3] << array[3][4]
  all_hourglasses << hourglasses

  # 7
  hourglasses = Array.new
  hourglasses << array[1][3] << array[1][4] << array[1][5]
  hourglasses <<                array[2][4]
  hourglasses << array[3][3] << array[3][4] << array[3][5]
  all_hourglasses << hourglasses

  # 8
  hourglasses = Array.new
  hourglasses << array[2][0] << array[2][1] << array[2][2]
  hourglasses <<                array[3][1]
  hourglasses << array[4][0] << array[4][1] << array[4][2]
  all_hourglasses << hourglasses

  # 9
  hourglasses = Array.new
  hourglasses << array[2][1] << array[2][2] << array[2][3]
  hourglasses <<                array[3][2]
  hourglasses << array[4][1] << array[4][2] << array[4][3]
  all_hourglasses << hourglasses

  # 10
  hourglasses = Array.new
  hourglasses << array[2][2] << array[2][3] << array[2][4]
  hourglasses <<                array[3][3]
  hourglasses << array[4][2] << array[4][3] << array[4][4]
  all_hourglasses << hourglasses

  # 11
  hourglasses = Array.new
  hourglasses << array[2][3] << array[2][4] << array[2][5]
  hourglasses <<                array[3][4]
  hourglasses << array[4][3] << array[4][4] << array[4][5]
  all_hourglasses << hourglasses

  # 12
  hourglasses = Array.new
  hourglasses << array[3][0] << array[3][1] << array[3][2]
  hourglasses <<                array[4][1]
  hourglasses << array[5][0] << array[5][1] << array[5][2]
  all_hourglasses << hourglasses

  # 13
  hourglasses = Array.new
  hourglasses << array[3][1] << array[3][2] << array[3][3]
  hourglasses <<                array[4][2]
  hourglasses << array[5][1] << array[5][2] << array[5][3]
  all_hourglasses << hourglasses

  # 14
  hourglasses = Array.new
  hourglasses << array[3][2] << array[3][3] << array[3][4]
  hourglasses <<                array[4][3]
  hourglasses << array[5][2] << array[5][3] << array[5][4]
  all_hourglasses << hourglasses

  # 15
  hourglasses = Array.new
  hourglasses << array[3][3] << array[3][4] << array[3][5]
  hourglasses <<                array[4][4]
  hourglasses << array[5][3] << array[5][4] << array[5][5]
  return all_hourglasses << hourglasses
end

# Complete the hourglassSum function below.
def hourglassSum(arr)
  max = -100
  curMax = 0
  a = get_hourglasses(arr)
  a.each do |x|
    curMax = x.inject(0){|sum,x| sum + x }
    curMax
    max = curMax if curMax > max
  end
  return max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()


=begin
# Scratch work

a = [[1,2,3], [4,5,6], [7,8,9]]

# Print array
def print_array(array)
  array.each do |x|

      # Loop over each cell in the row.
      x.each do |cell|
          print cell.to_s + ' '
      end

      # End of row.
      puts
  end
end

def get_hourglasses(array)
  all_hourglasses = Array.new

  # 0
  hourglasses = Array.new
  hourglasses << array[0][0] << array[0][1] << array[0][2]
  hourglasses <<                array[1][1]
  hourglasses << array[2][0] << array[2][1] << array[2][2]
  all_hourglasses << hourglasses

  # 1
  hourglasses = Array.new
  hourglasses << array[0][1] << array[0][2] << array[0][3]
  hourglasses <<                array[1][2]
  hourglasses << array[2][1] << array[2][2] << array[2][3]
  all_hourglasses << hourglasses

  # 2
  hourglasses = Array.new
  hourglasses << array[0][2] << array[0][3] << array[0][4]
  hourglasses <<                array[1][3]
  hourglasses << array[2][2] << array[2][3] << array[2][4]
  all_hourglasses << hourglasses

  # 3
  hourglasses = Array.new
  hourglasses << array[0][3] << array[0][4] << array[0][5]
  hourglasses <<                array[1][4]
  hourglasses << array[2][3] << array[2][4] << array[2][5]
  all_hourglasses << hourglasses

  # 4
  hourglasses = Array.new
  hourglasses << array[1][0] << array[1][1] << array[1][2]
  hourglasses <<                array[2][1]
  hourglasses << array[3][0] << array[3][1] << array[3][2]
  all_hourglasses << hourglasses

  # 5
  hourglasses = Array.new
  hourglasses << array[1][1] << array[1][2] << array[1][3]
  hourglasses <<                array[2][2]
  hourglasses << array[3][1] << array[3][2] << array[3][3]
  all_hourglasses << hourglasses

  # 6
  hourglasses = Array.new
  hourglasses << array[1][2] << array[1][3] << array[1][4]
  hourglasses <<                array[2][3]
  hourglasses << array[3][2] << array[3][3] << array[3][4]
  all_hourglasses << hourglasses

  # 7
  hourglasses = Array.new
  hourglasses << array[1][3] << array[1][4] << array[1][5]
  hourglasses <<                array[2][4]
  hourglasses << array[3][3] << array[3][4] << array[3][5]
  all_hourglasses << hourglasses

  # 8
  hourglasses = Array.new
  hourglasses << array[2][0] << array[2][1] << array[2][2]
  hourglasses <<                array[3][1]
  hourglasses << array[4][0] << array[4][1] << array[4][2]
  all_hourglasses << hourglasses

  # 9
  hourglasses = Array.new
  hourglasses << array[2][1] << array[2][2] << array[2][3]
  hourglasses <<                array[3][2]
  hourglasses << array[4][1] << array[4][2] << array[4][3]
  all_hourglasses << hourglasses

  # 10
  hourglasses = Array.new
  hourglasses << array[2][2] << array[2][3] << array[2][4]
  hourglasses <<                array[3][3]
  hourglasses << array[4][2] << array[4][3] << array[4][4]
  all_hourglasses << hourglasses

  # 11
  hourglasses = Array.new
  hourglasses << array[2][3] << array[2][4] << array[2][5]
  hourglasses <<                array[3][4]
  hourglasses << array[4][3] << array[4][4] << array[4][5]
  all_hourglasses << hourglasses

  # 12
  hourglasses = Array.new
  hourglasses << array[3][0] << array[3][1] << array[3][2]
  hourglasses <<                array[4][1]
  hourglasses << array[5][0] << array[5][1] << array[5][2]
  all_hourglasses << hourglasses

  # 13
  hourglasses = Array.new
  hourglasses << array[3][1] << array[3][2] << array[3][3]
  hourglasses <<                array[4][2]
  hourglasses << array[5][1] << array[5][2] << array[5][3]
  all_hourglasses << hourglasses

  # 14
  hourglasses = Array.new
  hourglasses << array[3][2] << array[3][3] << array[3][4]
  hourglasses <<                array[4][3]
  hourglasses << array[5][2] << array[5][3] << array[5][4]
  all_hourglasses << hourglasses

  # 15
  hourglasses = Array.new
  hourglasses << array[3][3] << array[3][4] << array[3][5]
  hourglasses <<                array[4][4]
  hourglasses << array[5][3] << array[5][4] << array[5][5]
  return all_hourglasses << hourglasses
end

def hourglassSum(arr)
  max = -100
  curMax = 0
  a = get_hourglasses(arr)
  a.each do |x|
    curMax = x.inject(0){|sum,x| sum + x }
    curMax
    max = curMax if curMax > max
  end
  return max
end

def get_2d_array_sum(array)
  sum = 0
  array.each do |a|
    a.each do |val|
      sum+=val if val.is_a? Integer
    end
  end
  return sum
end

print_array(a)
1 2 3
4 5 6
7 8 9

----------------------
a = [[1,1,1,0,0,0],
    [0,1,0,0,0,0],
    [1,1,1,0,0,0],
    [0,0,2,4,4,0],
    [0,0,0,2,0,0],
    [0,0,1,2,4,0]]
array = [[1,1,1,0,0,0],
        [0,1,0,0,0,0],
        [1,1,1,0,0,0],
        [0,0,2,4,4,0],
        [0,0,0,2,0,0],
        [0,0,1,2,4,0]]

hourglassSum(a)
=> 19

b = [
[-1,-1,0,-9,-2,-2],
[-2,-1,-6,-8,-2,-5],
[-1,-1,-1,-2,-3,-4],
[-1,-9,-2,-4,-4,-5],
[-7,-3,-3,-2,-9,-9],
[-1,-3,-1,-2,-4,-5]
]

get_hourglasses(b)

hourglassSum(b)
=> -6

print_array(a)
1 1 1 0 0 0
0 1 0 0 0 0
1 1 1 0 0 0
0 0 2 4 4 0
0 0 0 2 0 0
0 0 1 2 4 0

b = [[1,1,1],
     [nil,1,nil],
     [1,1,1]]

get_2d_array_sum(b)
  => 7

--------
=end

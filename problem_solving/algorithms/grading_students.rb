# https://www.hackerrank.com/challenges/grading/problem

def gradingStudents(grades)
    grades.each_with_index do |grade, i|
      if grade < 38
        grades[i] = grade
      elsif (5-(grade%5)) < 3
        grades[i] = grade + (5-(grade%5))
      end
    end
    return grades
end

p gradingStudents([73,67,38,33])
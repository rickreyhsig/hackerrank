def group_by_marks(marks, pass_marks)
  hsh = marks.group_by do |name,mark|
    next if name.empty?
    mark >= pass_marks ? 'Passed' : 'Failed'
  end
  hsh.delete(nil)
  return hsh
end

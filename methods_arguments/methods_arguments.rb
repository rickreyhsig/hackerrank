class MethodsArguments
  def take(arr, len=1)
    #p arr
    #p len
    #p arr[len,arr.length-1]
    #p '----'
    arr[len,arr.length]
  end
end

m =  MethodsArguments.new
p m.take([1,2,3], 1)
p m.take([1,2,3], 2)
p m.take([1,2,3])
p m.take([-4, 5, 9, 0], 4)
p m.take(["a", "b", 56, /d+/], 1)
p m.take([121, 35, 523, 898],0)

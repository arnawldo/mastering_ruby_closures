reduce = lambda do |acc, arr, binary_operation| 
  reduce_aux = lambda do |acc, arr|
    if arr.empty?
      acc
    else
      reduce_aux.call(binary_operation.call(acc, arr.first), arr.drop(1))
    end
  end

  reduce_aux.call(acc, arr)
end

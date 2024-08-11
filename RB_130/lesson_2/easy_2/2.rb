def zip(arr1, arr2)
  index = 0
  zipped = []
  until index >= arr1.size
    zipped << [arr1[index], arr2[index]]
    index += 1
  end
  zipped
end

p zip([1, 2, 3], [4, 5, 6]) #== [[1, 4], [2, 5], [3, 6]]
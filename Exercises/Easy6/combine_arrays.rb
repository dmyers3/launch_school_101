def merge(arr1, arr2)
  (arr1 << arr2).flatten.uniq
end

p merge([1, 3, 5], [3, 6, 9])
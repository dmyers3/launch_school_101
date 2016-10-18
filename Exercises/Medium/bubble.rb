def bubble_sort!(array)
  changes = 0
  loop do
    changes = 0
    0.upto(array.size - 2) do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        changes += 1
      end
    end
    break if changes == 0
  end
end

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array
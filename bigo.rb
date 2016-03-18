def contiguous_sum(arr)
  largest_sum = 0
  running_sum = 0
  arr.each do |el|
    if running_sum + el > running_sum
      running_sum += el
    else
      running_sum = 0
    end
    largest_sum = running_sum if running_sum > largest_sum
  end
  largest_sum
end

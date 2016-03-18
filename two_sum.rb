def bad_two_sum?(arr, target_sum)
  indices = (0...arr.size).to_a
  indices.product(indices).select { |x,y| x < y }.any? do |x,y| #O(n^2)
    arr[x] + arr[y] == target_sum
  end
end

def okay_two_sum?(arr, target_sum)
  sorted_arr = merge_sort(arr) #O(nlog(n))
  sorted_arr.each do |el| #O(n)
    return true if binary_search(sorted_arr, target_sum - el) #O(log(n))
  end
  false
end

def binary_search(arr, target)
  return false if arr.nil? || arr.empty?
  middle = arr[arr.length / 2]
  if middle == target
    return true
  elsif middle < target
    binary_search(arr[middle + 1..-1], target)
  else
    binary_search(arr[0...middle], target)
  end
end

def merge_sort(arr)
  return arr if arr.size <= 1

  left = merge_sort(arr[0...(arr.size / 2)])
  right = merge_sort(arr[(arr.size / 2)..-1])

  merge(left,right)
end

def merge(left,right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left.drop(1), right)
  else
    [right.first] + merge(left, right.drop(1))
  end
end

def pair_sum?(arr, target_sum)
  hash = Hash.new(0) #<-- BADASS

  arr.each do |el| #O(n)
    hash[el] += 1
  end

  arr.each do |el| #O(n) with O(1) lookups
    if target_sum - el == el
      return hash[el] >= 2
    else
      return true if hash[target_sum - el] >= 1
    end
  end
  false
end

require_relative 'stack_queue'
require 'byebug'
def naive_windowed_range(arr, window_size)
  current_max_range = nil
  arr.each_with_index do |el, i|
    break if i + window_size == arr.length
    temp = arr[i...i + window_size]
    current_max_range = temp.max - temp.min if current_max_range.nil? || current_max_range < (temp.max - temp.min)
  end
  current_max_range
end

def windowed_max_range(arr, window_size)
  max_range = nil
  queue = MinMaxStackQueue.new
  # byebug
  arr.each do |el|
    if queue.size < window_size
      queue.enqueue(el)
    else
      queue.dequeue
      queue.enqueue(el)
      if max_range.nil? || queue.max - queue.min > max_range
        max_range = queue.max - queue.min
      end
    end
  end

  max_range
end

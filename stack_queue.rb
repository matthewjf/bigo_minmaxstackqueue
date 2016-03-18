require 'byebug'
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(junk)
    @store << junk
  end

  def dequeue(other_junk)
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
  end

  def max
    peek.nil? ? nil : peek.max
  end

  def min
    peek.nil? ? nil : peek.min
  end

  def pop
    @store.pop
  end

  def push(val)
# byebug
    return @store.push(Triple.new(val,val,val)) if empty?

    max = val > peek.max ? val : peek.max
    min = val < peek.min ? val : peek.min

    @store.push(Triple.new(val, max, min))
  end

  def peek
    @store.last
  end

  def empty?
    @store.empty?
  end

  def size
    @store.size
  end
end

class MinMaxStackQueue
  def initialize
    @enq = MyStack.new
    @deq = MyStack.new
  end

  def enqueue(val)
    @enq.push(val)
  end

  def dequeue
    if @deq.empty?
      until @enq.empty?
        @deq.push(@enq.pop.val)
      end
    end

    @deq.pop
  end

  def size
    @enq.size + @deq.size
  end

  def empty?
    @enq.empty? && @deq.empty?
  end

  def max
    emax = @enq.peek.nil? ? nil : @enq.peek.max
    dmax = @deq.peek.nil? ? nil : @deq.peek.max
    if emax.nil?
      dmax
    elsif dmax.nil?
      emax
    elsif emax > dmax
      emax
    else
      dmax
    end
  end

  def min
    emin = @enq.peek.nil? ? nil : @enq.peek.min
    dmin = @deq.peek.nil? ? nil : @deq.peek.min
    if emin.nil?
      dmin
    elsif dmin.nil?
      emin
    elsif emin < dmin
      emin
    else
      dmin
    end
  end

end

class Triple
  attr_reader :val, :max, :min

  def initialize(val, max, min)
    @val = val
    @max = max
    @min = min
  end

  def inspect
    "val: #{val}, max: #{max}, min: #{min}"
  end
end

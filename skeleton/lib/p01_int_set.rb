class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false) 
  end

  def insert(num)
      if num >= @store.length
        raise ArgumentError.new("Out of bounds")
      end
      if num < 0
        raise ArgumentError.new("Out of bounds")
      end
      @store[num] = true
  end

  def remove(num)
    if num > @store.length
      raise "OOB"
  end
  if num < 0
      raise "OOB"
  end
  @store[num] = false
  end

  def include?(num)
      if @store[num] == false
        return false
      else
        return true
      end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % 20
        @store[bucket_idx] << num
  end

  def remove(num)
    bucket_idx = num % 20
    removing_ele_idx = @store[bucket_idx].index(num)
    @store[bucket_idx] = @store[bucket_idx][0...removing_ele_idx] + @store[bucket_idx][removing_ele_idx + 1..-1] 
  end

  def include?(num)
    bucket_idx = num % 20
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end

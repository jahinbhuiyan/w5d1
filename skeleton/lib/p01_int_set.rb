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

    if @count < self.num_buckets 
      if !self[num].include?(num)
        bucket_idx = num % @store.length
        @store[bucket_idx] << num
        @count += 1
      end
    else
      new_buckets = self.resize!

      @store.each do |bucket|
        bucket.each do |ele|
          bucket_idx = ele % new_buckets.length
          new_buckets[bucket_idx] << ele
        end
      end
      @store = new_buckets
      self.insert(num)
    end



  end

  def remove(num)

    if self[num].include?(num)
      bucket_idx = num % @store.length
      removing_idx = self[num].index(num)
      @store[bucket_idx] = self[num][0...removing_idx] + self[num][removing_idx + 1..-1]
      @count -= 1
    end

  end

  def include?(num)
    return self[num].include?(num)
  end

  private

  def [](num)
    bucket_idx = num % @store.length
    return @store[bucket_idx] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    previous_buckets = self.num_buckets

    return new_buckets = Array.new(previous_buckets * 2) { Array.new }

    


      
  
  end
end

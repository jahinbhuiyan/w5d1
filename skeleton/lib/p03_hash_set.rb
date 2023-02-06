class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash 
    if @count < self.num_buckets 
      if !self[num].include?(num)
        bucket_idx = num % @store.length
        @store[bucket_idx] << key
        @count += 1
      end
    else
      new_buckets = self.resize!

      @store.each do |bucket|
        bucket.each do |ele|
          num = ele.hash
          bucket_idx = num % new_buckets.length
          new_buckets[bucket_idx] << ele
        end
      end
      @store = new_buckets
      self.insert(key)
    end
  end

  def include?(key)
    bucket_idx = key.hash % self.num_buckets
    self[key.hash].include?(key)
  end

  def remove(key)
    num = key.hash
    if self[num].include?(key)
      self[num].delete(key)
      # bucket_idx = num % @store.length
      # removing_idx = self[num].index(key)
      # @store[bucket_idx] = self[num][0...removing_idx] + self[num][removing_idx + 1..-1]
      @count -= 1
    end

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

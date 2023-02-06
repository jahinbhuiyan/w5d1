class MaxIntSet
    
    def initialize(int)
        @store = Array.new(int, false) 
    end

    def insert(num)
        if num > @store.length
            raise "OOB"
        end
        if num < 0
            raise "OOB"
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
        elsif @store[num] == true
            return true
        end
    end
end

class IntSet

    attr_reader :store

    def initialize
        @store = Array.new(20) {Array.new}
    end

    def insert(num)
        bucket_idx = num % 20
        @store[bucket_idx] << num
    end

    def [](num)
        bucket_idx = num % 20
        return @store[bucket_idx]
    end
end

class ResizingIntSet

    def initialize(n)
        @store = Array.new(n*n){Array.new} 
        @length = n * n       
        @store_count = 0
    end
    
    
    def insert(num)
        if @store_count < @length
            bucket_idx = num % @store.length
            @store[bucket_idx] << num
        else
            
    end 
end
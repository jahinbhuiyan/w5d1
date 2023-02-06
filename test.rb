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

    def initialize
        length = Array.new(20) {Array.new}
    end

    def insert(num)
        bucket_idx = num % 20
        length[bucket_idx] << num
    end
end
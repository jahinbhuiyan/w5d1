class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_id = 0

    self.each_with_index do |ele, idx|
      hash_id += ele.hash * idx
    end
    
    return hash_id
  end
end

class String
  def hash

    hash_id = 0

    self.each_char.with_index do |char, idx|
      hash_id += char.ord * idx
    end

    return hash_id

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    hash_id = 0
    self.each do |key, value|

      hash_id += key.to_s.ord * value.to_s.ord

    end

    return hash_id
  end
end

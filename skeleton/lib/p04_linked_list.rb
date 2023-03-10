class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    return @head
  end

  def last
    return @tail
  end

  def empty?
    return true if @head.val.nil?
    return false
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    # appending_node = Node.new(key, val)
    # appending_node.prev = @tail
    # @tail.next = appending_node
    # @tail = appending_node
    if @head.val.nil?
      @head = Node.new(key, val)
      @head.next = @tail
      @tail.prev = @head
    elsif @tail.val.nil?
      @tail = Node.new(key, val)
      @head.next = @tail
      @tail.prev = @head
    else
      appending_node = Node.new(key, val)
      appending_node.prev = @tail
      @tail.next = appending_node
      @tail = appending_node
    end

  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end

class Node
  attr_accessor :value, :next

  def initialize(value = nil, next_node = nil)
    @value = value
    @next = next_node
  end

  def append(node)
    @next = node
  end

  def to_s
    if @next 
      "#{@value} ->#{@next.value}"
    else
     "#{@value} -> NIL"
    end
  end
end

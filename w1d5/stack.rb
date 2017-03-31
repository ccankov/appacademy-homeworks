# Stack implementation using Array data type
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
    nil
  end

  def remove
    @stack.pop
    nil
  end

  def show
    @stack
  end
end

stack = Stack.new

puts 'Stack tests:'
stack.add(5)
puts stack.show == [5]
stack.add(10)
puts stack.show == [5, 10]
stack.remove
puts stack.show == [5]

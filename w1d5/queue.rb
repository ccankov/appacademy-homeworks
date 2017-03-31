# Queue implementation using Array data type
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    nil
  end

  def dequeue
    @queue.shift
    nil
  end

  def show
    @queue
  end
end

queue = Queue.new

puts 'Queue tests:'
queue.enqueue(5)
puts queue.show == [5]
queue.enqueue(10)
puts queue.show == [5, 10]
queue.dequeue
puts queue.show == [10]

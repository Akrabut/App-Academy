require_relative 'adt'

class MyQueue
  include ADT

  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end
end



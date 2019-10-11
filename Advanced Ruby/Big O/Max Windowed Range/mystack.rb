require_relative 'adt'

class MyStack
  include ADT

  def initialize
    @store = []
  end

  def push(el)
    @store.push(el)
  end

  def dequeue
    @store.pop
  end
end
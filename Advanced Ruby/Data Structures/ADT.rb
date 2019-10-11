class Stack
  def initialize
    # create ivar to store stack here!
    @arr = []
  end

  def push(el)
    # adds an element to the stack
    # wtf is this language???????????
    i = @arr.length - 1
    while i >= 0
      @arr[i + 1] = @arr[i]
      i -= 1
    end
    @arr[0] = el
  end

  def pop
    # removes one element from the stack
    @arr.delete(@arr.last)
  end

  def peek
    # returns, but doesn't remove, the top element in the stack
    @arr[0]
  end
end

class Queue
  def initialize
    @arr = []
  end

  def enqueue(e)
    @arr[@arr.length] = e
  end

  def dequeue
    @arr.map!.with_index {|e, i| e = @arr[i + 1]}
    @arr.delete(@arr.last)
  end
end

class Map
  def initialize
    @map = []
  end
  
  def set(key, value)
    @map.each do |arr|
      if arr[0] == key
        arr[1] = value 
        return
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each { |arr| return arr[1] if arr[0] == key }
  end

  def delete(key)
    @map.each { |arr| @map.delete(arr) if arr[0] == key }
  end

  def show
    p @map
  end
end




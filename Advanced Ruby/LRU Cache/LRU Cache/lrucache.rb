class LRUCache
  def initialize(capacity)
    @capacity = capacity - 1
    @cache = Array.new(@capacity)
    @size = 0
  end

  def count
    # returns number of elements currently in cache
    @size = @cache.count { |e| e }
  end

  def add(el)
    # adds element to cache according to LRU principle
    if (i = @cache.index(el))
      return shift_range_left(i, el)
    end
    @size += 1 if @size < @capacity
    shift_range_left(0, el)
    @cache[@capacity] = el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end

private
  # helper methods go here!
  def shift_range_left(i, el)
    while i <= @capacity
      @cache[i] = @cache[i + 1]
      i += 1
    end
    @cache[@capacity] = el
  end
end



johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show

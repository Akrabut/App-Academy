# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def check_nil_int
    return nil if self == [] || !(self.all? {|i| i.is_a?(Integer)})
    true
  end
  def span
    return nil if self.check_nil_int == nil
    self.max - self.min
  end
  def average
    return nil if self.check_nil_int == nil
    self.sum.to_f / self.length
  end
  def median
    return nil if self.check_nil_int == nil
    return self.sort[(self.length-1) / 2] if self.length % 2 == 1
    self.sort[(self.length/2 - 1)..self.length/2].average
  end
  def counts
    hash = Hash.new(0)
    self.each {|e| hash[e] += 1}
    hash
  end
  def my_count(x)
    self.counts[x]
  end
  def my_index(x)
    self.each.with_index {|e, i| return i if e==x}
    nil
  end
  def my_uniq
    newarr = []
    self.each {|e| newarr << e if !newarr.include?(e)}
    newarr
  end
  def my_transpose
    return nil if self.length != self[0].length
    newarr = []
    self.each.with_index do |e1, i1|
      temparr = []
      self.each.with_index do |e2, i2|
        temparr << self[i2][i1]
      end
      newarr << temparr
    end
    newarr
  end
end


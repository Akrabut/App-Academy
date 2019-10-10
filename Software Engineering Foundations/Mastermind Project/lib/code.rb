class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? {|e| POSSIBLE_PEGS.keys.include?(e.upcase)}
  end

  def initialize(arr)
    #raise "Invalid pegs" if !Code.valid_pegs?(arr)
    @pegs = arr.each {|e| e.upcase!}
  end

  def self.random(num)
    arr = []
    while !Code.valid_pegs?(arr) || arr.length < num
      arr = []
      num.times {|i| arr << ("a".."z").to_a.sample}
    end
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def exact_match?(pegs, i)
    pegs[i] == @pegs[i]
  end

  def num_exact_matches(code)
    amt = 0
    code.pegs.each.with_index {|e, i| amt += 1 if exact_match?(code.pegs, i)}
    amt
  end
  
  def num_near_matches(code)
    amt = 0
    code.pegs.each.with_index {|e, i| amt += 1 if @pegs.include?(e) && !exact_match?(code.pegs, i)}
    amt
  end

  def ==(code)
    code.pegs == @pegs
  end

end





require_relative "code"

class Mastermind

  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "#{@secret_code.num_exact_matches(code)} exact matches"
    puts "#{@secret_code.num_near_matches(code)} near matches"
  end

  def ask_user_for_guess
    print "Enter a code"
    ipt = Code.new(Code.from_string(gets.chomp))
    print_matches(ipt)
    true if ipt == @secret_code
  end
end


require_relative "./employee"

class Startup
  
  attr_reader :name, :funding, :employees, :salaries

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
   @salaries.keys.include?(title) 
  end

  def >(other)
    @funding > other.funding
  end

  def hire(name, title)
    raise "Invalid title" if !valid_title?(title)
    @employees << Employee.new(name, title)
  end

  def size
    @employees.length
  end

  def pay_employee(emp)
    amt_to_pay = salaries[emp.title]
    if @funding >= amt_to_pay
      emp.pay(amt_to_pay)
      @funding -= amt_to_pay
      return
    end
    raise "Not enough funds to hire this guy"
  end

  def payday
    @employees.each {|e| pay_employee(e)}
  end

  def average_salary
    sum = 0
    @employees.each {|e| sum += @salaries[e.title] }
    sum.to_f / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other)
    @funding += other.funding
    other.employees.each {|e| @employees << e}
    other.salaries.each {|k, v| @salaries[k] = v if !salaries.keys.include?(k)}
    other.close
  end

end

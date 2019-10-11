class Employee

  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    boss.employees << self if boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def sum_of_salaries(emp)
    emp.employees.reduce(0) { |total, em| total + em.salary } + emp.salary
  end

  def bonus(multiplier)
    (@employees.reduce(0) do |total, em|
      if em.is_a? Manager
        total + sum_of_salaries(em)
      elsif em.is_a? Employee
        total + em.salary
      end
    end) * multiplier unless @employees.empty?
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)


p ned.bonus(5)
p ned.is_a? Employee
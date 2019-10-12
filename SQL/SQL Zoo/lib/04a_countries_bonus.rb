# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
  select name
  from countries
  where gdp > (
    select max(gdp)
    from countries
    where continent like 'Europe'
  )
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
  select q1.continent, q1.name, q1.area
  from countries as q1, countries as q2
  group by q1.continent, q1.name, q1.area, q2.continent
  having q1.area = max(q2.area)
  and q1.continent = q2.continent
  SQL
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
  select q1.name, q1.continent
  from countries as q1
  where q1.population/3 > (
    select max(population)
    from countries as q2
    where q1.continent = q2.continent
    and q1.name != q2.name
  )
  SQL
end

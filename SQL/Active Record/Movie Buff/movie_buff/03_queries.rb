def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select('movies.id, title')
    .joins(:actors)
    .group('movies.id')
    .where('actors.name in (?)', those_actors)
    .having('count(actors.name) >= (?)', those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('(yr / 10) * 10 as decade')
    .order('avg(score) desc')
    .group('decade')
    .first
    .decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  subquery =  Movie
              .select('movies.id')
              .joins(:actors)
              .where('actors.name in (?)', name)
  Actor
    .select(:name)
    .joins(:movies)
    .where('actors.name not in (?)', name)
    .where('movies.id in (?)', subquery)
    .distinct
    .pluck(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .select(:id)
    .joins('left join castings on actors.id = actor_id')
    .where('castings.movie_id is null')
    .count
end

def whazzer?(whazzername, name)
  i = 0
  newstr = ""
  name.each_char do |c|
    break if i == whazzername.length
    if c.downcase == whazzername[i].downcase
      newstr += whazzername[i]
      i += 1
    end
  end
  whazzername == newstr
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  arr = Actor.pluck(:name)
  arr.select! { |name| whazzer?(whazzername, name) }

  Movie
    .joins(:actors)
    .where('actors.name in (?)', arr)
end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end

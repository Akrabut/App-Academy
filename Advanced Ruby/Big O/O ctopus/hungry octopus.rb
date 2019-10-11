require 'time'

FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].freeze

def sluggish_octopus
  FISHES.reduce('') do |fish1|
    FISHES.reduce('') { |fish2| fish2.length > fish1.length ? fish2 : fish1 }
  end
end

def dominant_octopus
  FISHES.sort_by(&:length).last
end

def clever_octopus
  FISHES.reduce { |biggest_fish, fish| fish.length > biggest_fish.length ? fish : biggest_fish }
end

def sluggish
  start = Time.now
  sluggish_octopus
  Time.now - start
end

def dominant
  start = Time.now
  dominant_octopus
  Time.now - start
end

def clever
  start = Time.now
  clever_octopus
  Time.now - start
end

puts "sluggish 1 - #{sluggish}, sluggish 2 - #{sluggish}, sluggish 3 - #{sluggish}"
puts "dominant 1 - #{dominant}, dominant 2 - #{dominant}, dominant 3 - #{dominant}"
puts "clever 1 - #{clever}, clever 2 - #{clever}, clever 3 - #{clever}"
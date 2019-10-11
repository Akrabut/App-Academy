TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ].freeze

def slow_dance(direction)
  TILES_ARRAY.each.with_index { |dir, i| return i if dir == direction }
end

TILES_HASH = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6, "left-up"=>7}

def constant_dance(direction)
  TILES_HASH[direction]
end

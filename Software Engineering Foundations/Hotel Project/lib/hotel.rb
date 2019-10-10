require_relative "room"

class Hotel

  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each {|k, v| @rooms[k] = Room.new(v)}
  end

  def name
    str = @name.split(" ")
    str.each_index {|i| str[i].capitalize!}.join(" ")
  end

  def rooms
    @rooms
  end
  
  def room_exists?(name)
    @rooms.keys.include?(name)
  end

  def check_in(person, room)
    if !room_exists?(room)
      puts "sorry, room does not exist"
      return
    end
    @rooms[room].add_occupant(person) ? (puts "check in successful") : (puts "sorry, room is full")
  end

  def has_vacancy?
    @rooms.all? {|k, v| rooms[k].full?} ? false : true
  end

  def list_rooms
    @rooms.each {|k, v| puts "#{k}.*#{@rooms[k].available_space}"}
  end

end

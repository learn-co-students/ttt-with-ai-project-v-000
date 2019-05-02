class Board

attr_accessor :cells

def initialize
  reset!
end

def reset!
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(user_input)
  user_input = user_input.to_i
  @cells[user_input -1]
end

# below also returns false for an in-progress game/it's asking are there none of these? The word "these" being empty cells = false
def full?
  cells.none? {|cell| cell == " " || cell == nil}
end

def turn_count
  cells.count { |cell| cell == "X" || cell == "O"}
end

def taken?(user_input)
  position(user_input) == "X" || position(user_input) == "O"
end

def valid_move?(user_input)
  user_input = user_input.to_i
  !(taken?(user_input)) && user_input.between?(1, 9)
end

def update(user_input, player)
  user_input = user_input.to_i
  cells[user_input -1] = player.token
  end
end

class Board
attr_accessor :cells

def initialize
  reset!
end


def reset!
  @cells = Array.new(9, " ")
end

def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(input)
  cells[input.to_i - 1]
end


def turn_count
@cells.count{|token| token == "X" || token == "O"}
end

def token
turn_count % 2 == 0 ? "X" : "O"
end


def update(position, player)
  player = token
  cells[position.to_i - 1] = player
end

def full?
  cells.all?{|spot| spot == "X" || spot == "O"}
end

def taken?(spot)
  !(position(spot) == "" || position(spot) == " ")
end

def valid_move?(spot)
  !taken?(spot.to_i) && spot.to_i.between?(1,9)
end

end

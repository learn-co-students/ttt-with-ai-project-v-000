require 'pry'

class Board
  attr_accessor :cells, :board, :token

  turn_count = 0

  def initialize
    self.cells = Array.new(9, " ")
    board
  end



def reset!
  self.cells = Array.new(9, " ")
end

def display
  puts " #{cells[0]}"" | ""#{cells[1]}"" | " "#{cells[2]} "
  puts "-----------"
  puts " #{cells[3]}"" | ""#{cells[4]}"" | " "#{cells[5]} "
  puts "-----------"
  puts " #{cells[6]}"" | ""#{cells[7]}"" | " "#{cells[8]} "
end

def position(input)
  index = input.to_i - 1
  cells[index]
end

def full?
  if cells.any? { |cell| cell == " "}
    false
  else
    true
  end
end

def turn_count
  self.cells.count{ |cell| cell == "X" || cell == "O" }

end

def taken?(input)
  index = input.to_i - 1
  if cells[index] == "X" || cells[index] == "O"
    true
  else
    false
  end
end

def valid_move?(input)
  if taken?(input) == true || !input.to_i.between?(1, 9)
    false
  else
    true
  end
end

def update(input, player)
  index = input.to_i - 1
  cells[index] = player.token
end


end

class Board
  attr_accessor :cells

def reset!
  @cells =  Array.new(9, " ")
end

def initialize
  reset!
end

def display
     puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
     puts "-----------"
     puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
     puts "-----------"
     puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end

def position(input)
  cells[input.to_i-1]
end

def full?
  if !cells.include?(" ")
    return true
  else false
  end
end


def turn_count
  cells.count { |value| value == "X" || value == "O"}
end

def taken?(input)
  if @cells[input.to_i - 1] == " "
     return false
  else true
  end
end

def valid_move?(input)
  if (1..9).include?(input.to_i) && !taken?(input)
    return true
  else false
  end
end

def update (input, player)
  if valid_move?(input)
    @cells[input.to_i - 1] = player.token
  end
end

end

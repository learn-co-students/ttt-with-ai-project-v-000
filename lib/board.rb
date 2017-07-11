require "pry"

class Board
  attr_accessor :cells, :player

def initialize
  reset!
end

def reset!
  @cells = Array.new(9, " ")
end

def display
  line = "-----------"
  row1 = " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  row2 = " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  row3 = " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  puts row1
  puts line
  puts row2
  puts line
  puts row3
end

def position(input)
  input = input.to_i - 1
  value = @cells[input]
end

def full?
 if @cells.include?(" ")
    false
 else
    true
 end
end

def turn_count
  counter = 0
  @cells.each do |cell|
    if cell != " "
      counter += 1
    end
  end
  counter
end

def taken?(input)
  input = input.to_i - 1
  if @cells[input] == "X" || @cells[input] == "O"
    return true
  else false
  end
end

def valid_move?(input)
  input = input.to_i - 1
  if (input.between?(0,8) == false) && (taken?(input) == true)
    false
  else
    true
  end
end

def update(input, player)
  index = index.to_i
  @cells[index] = token
end

end

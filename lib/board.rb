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
  puts "         "
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  puts "         "
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
  turns = self.cells.find_all {|cell| cell != " "}
  turns.length
end

def taken?(input)
  input = input.to_i - 1
  if @cells[input] == "X" || @cells[input] == "O"
    return true
  else false
  end
end

def valid_move?(input)
  input.to_i.between?(1,9) && !taken?(input)
end

def update(input, player)
  input = input.to_i - 1
  @cells[input] = player.token
end

end

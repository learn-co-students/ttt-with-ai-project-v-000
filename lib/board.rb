require "pry"

class Board
  attr_accessor :cells

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

def position(cells)
  input = STDIN.gets.chomp.to_i
  value = @cells[input-1]
end

end

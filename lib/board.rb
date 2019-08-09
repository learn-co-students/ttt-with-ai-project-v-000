require 'pry'
class Board
 attr_accessor :cells

 def initialize
  self.reset!
 end

 def reset!
  self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end

 def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
 end

 def position(input)
   index = input.to_i - 1
   self.cells[index]

  end

  def full?
    self.cells.none? { |cell| cell == " " }
  end

  def turn_count
   self.cells.count{ |cell| cell == "X" || cell == "O" } 
  end

  def taken?(position)
    index = position.to_i-1
    if self.cells[index] != " "
     true
    else
     false
    end
  end

  def valid_move?(position)
   position.to_i.between?(1,9) && !taken?(position)
  end

  def update(position, player)
    index = position.to_i-1
    self.cells[index] = player.token
  end

end

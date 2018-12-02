require 'pry'
class Board
  attr_accessor :cells
  
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  
  def initialize
    self.reset!
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(position)
   pos=position.to_i
   pos -=1
    @cells[pos]
  end

  def full?
   # binding.pry
     @cells.none? { |square| square ==" " }
  end

end
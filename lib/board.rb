require 'pry'
class Board
  attr_accessor :cells
  
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
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
   @cells[input.to_i-1]
  end

  def full?
     @cells.none? { |square| square ==" " }
  end

  def turn_count
    @cells.count { |t| t == "X" || t =="O" }
  end
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end
  
  def valid_move?(user_move)
     user_move.to_i.between?(1,9) && !taken?(user_move.to_i)
  end
  
  def update(input,player)
    cells[input.to_i-1] = player.token
  end
  
 

end
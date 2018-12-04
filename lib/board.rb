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
     @cells.none? { |square| square ==" " }
  end

  def turn_count
    @cells.count { |t| t == "X" or t =="O" }
  end
  
  def taken?(pos)
    self.position(pos) == "X" || self.position(pos) == "O"
  end
  
  def valid_move?(user_move)
     user_move=user_move.to_i
     (1..9)===user_move && !self.taken?(user_move)
  end
  
  def update(pos,player)
    position(pos)
    pos=pos.to_i
    pos-=1
    @cells[pos] = player.token
  end

   def taken?(pos)
     # binding.pry
    self.position(pos) == "X" || self.position(pos) == "O"
   # binding.pry
  end
  
 

end
class Board
  attr_accessor :cells
  
  def initialize
  @cells = Array.new(9, " ")
  end

  def reset!
  self.cells = Array.new(9, " ")
  end
  
  def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(num)
     self.cells[num.to_i-1]
   end
  
   def full?
     @cells.all? do |i| 
       i == "X" || i == "O" 
   end
  end 
  
   def turn_count
  @cells.count { |turn1| turn1 == "X" || turn1 == "O" }
  end 
  
  def taken?(index)
  @cells[index.to_i-1] == "X" || @cells[index.to_i-1] == "O"
  end
  
  def valid_move?(index)
  index.to_i.between?(1, 9) && !taken?(index.to_i)
  end
  
  def update(index, player)
     cells[index.to_i-1] = player.token
    
   end
  
end 

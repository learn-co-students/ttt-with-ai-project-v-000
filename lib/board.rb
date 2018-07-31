class Board 
  attr_accessor :cells
  
  def initialize 
    self.reset! 
  end 
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display 
    puts " #{@cell[0]} | #{@cell[1]} | #{@cell[2]} " 
    puts " #{@cell[3]} | #{@cell[4]} | #{@cell[5]} " 
    puts " #{@cell[6]} | #{@cell[7]} | #{@cell[8]} " 
  end 
  
  def position(user_input)
    i = user_imput.to_i - 1 
  end
  
  def update(position, player)
    @cell[position] = player.token 
  end
  
  def full?
    @cell.all? {|e| e == "X" or e == "O"}
  end 
  
  def turn_count 
    cell.count {|e| e == "X" or e == "O"}
  end
  
  def taken?(position) 
    @cell.any? {|e| e == "X" or e == "O"}
  end 
  
  def valid_move?(position)
    !taken(position) && postion.between?(1, 9)
  end
end
  
  
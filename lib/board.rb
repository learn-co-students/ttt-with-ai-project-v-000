class Board 
  attr_accessor :cells
  
  def initialize 
    @cells = []
    self.reset! 
  end 
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} " 
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} " 
  end 
  
  def position(user)
    i = user.to_i - 1 
    @cells[i]
  end
  
  def update(position, player)
    @cells[position] = player.token 
  end
  
  def full?
    @cells.all? {|e| e == "X" or e == "O"}
  end 
  
  def turn_count 
    @cells.count {|e| e == "X" or e == "O"}
  end
  
  def taken?(position) 
    !(@cells[position] ==  " " || @cells[position] == "" || @cells[position] == nil) ?
    false : true
  end 
  
  def valid_move?(position)
    !taken(position) && postion.between?(1, 9)
  end
end
  
  
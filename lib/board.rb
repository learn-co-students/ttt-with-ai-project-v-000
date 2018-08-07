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
    i = position.to_i - 1
    @cells[i] = player.token 
  end
  
  def full?
    @cells.all? {|e| e == "X" or e == "O"}
  end 
  
  def turn_count 
    @cells.count {|e| e == "X" or e == "O"}
  end
  
  def taken?(input) 
    # binding.pry
    i = input.to_i - 1
    
    !(@cells[i] ==  " " || @cells[i] == "" || @cells[i] == nil) ? true : false
  end 
  
  def valid_move?(position)
    !taken?(position) && position.to_i.between?(1, 9)
  end
end
  
  
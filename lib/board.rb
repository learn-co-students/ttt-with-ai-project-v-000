class Board
  attr_accessor :cells
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end 
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  def position(input)
    index = input.to_i - 1
    @cells[index]
  end 
  def update(posittion_user,player_token) 
  end 
  def token 
  end 
  def taken?
  end 
  def turn_count
  end 
  def full?
    if @cells[index]
  end 
  def valid_move?
  end 
    
  

end 
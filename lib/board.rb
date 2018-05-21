class Board
  def initialize(cells)
    @cells = reset!
  end 
  def reset!
    @cells = ["","","","","","","","",""]
  end 
  def display 
    @cells
  end 
  def position
    input = gets.strip 
    index = input.to_i - 1
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
  end 
  def valid_move?
  end 
    
  

end 
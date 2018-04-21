class Board
  attr_accessor :cells
  
  def initialize
    self.reset!
  end
  
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
  end 

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " -----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 

  def position(input)
    @cells[input.strip.to_i - 1]
  end 
  
  def full?
    @cells.include?(" ") == false
  end 
  
  def turn_count
  @cells.count("X") + @cells.count("O")
  end
  
  def taken?(input)
  self.position(input)  == "X" || self.position(input) == "O"
  end 
  
  def valid_move?(input)
    self.taken?(input) == false && input.to_i > 0 && input.to_i < 10 
  end 
  
  def update(input, player)
    if valid_move?(input)
      @cells[input.to_i - 1] = player.token
    end 
  end 
  
end 
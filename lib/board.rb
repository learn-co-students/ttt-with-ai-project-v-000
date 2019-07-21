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
    user_input = input.to_i - 1 
    @cells[user_input]
  end 
  
  
  def full?
    @cells.all?{|cell| cell != " "}
  end 
  
  def turn_count
    @cells.count{|cell| cell != " "}
  end 
  
  def taken?(input)
    position(input) != " "
  end 
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end 
  
  def update(input, player)
    user_input = input.to_i - 1 
    @cells[user_input] = player.token
      #why can't I do position(input) = player.token?
  end 

end 
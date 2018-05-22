class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9, " ")
  end 
  
  def reset!
    @cells = Array.new(9, " ")
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
  
  def update(input,player_token)
    
    #@cells[input.to_i - 1] = player_token.token
    position(input) = player_token.token
  end 
  
  def token 
  end 
  
  def taken?(input)
    position(input) == "X" || position(input) == "O"  ? true : false 
    
  end 
  
  def turn_count
    positions_taken = @cells.select {|position| position != " "}
    positions_taken.length
  end 
  
  def full?
    @cells.all? {|position| position != " "} ? true : false
  end 
  
  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && taken?(input) == false  ? true : false  
  end 
    
  

end 
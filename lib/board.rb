class Board
  attr_accessor :cells
  def initialize
    reset!
  end 
  
  def reset!
    @cells = Array.new(9, " ")
  end 
  
  def display 
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end 
  
  def position(input)
    @cells[input.strip.to_i - 1]
  end 
  
  def full?
    !@cells.include?(" ")
  end 
  
  def turn_count
    @cells.count {|p| p != " "} 
  end 
  
  def taken?(input)
    position(input) != " "
  end 
  
  def valid_move?(input)
    input.strip.to_i.between?(1, 9) && !taken?(input)
  end 
  
  def update(input, player)
    if valid_move?(input)
      @cells[input.strip.to_i - 1] = player.token
    end 
  end 
end 

    
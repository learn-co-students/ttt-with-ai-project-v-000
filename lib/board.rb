class Board 
  attr_accessor :cells 
  
  def initialize
    reset!
  end 
  
  def reset!
    @cells = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end 
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end 
  
  def position(input)
    input = input.to_i 
    input -= 1  
    @cells[input]
  end 
  
  def update(position_choice, player) 
    position_choice = position_choice.to_i
    input = position_choice - 1
    cells[input] = player.token       
  end 
  
  def full?
    if cells.all? { |cell| cell == "O" || cell == "X" }
      true
    else 
      false 
    end 
  end 
  
  def turn_count
    turn_count = cells.count("X") + cells.count("O")
    turn_count  
  end 
  
  def taken?(cell_position)
    position(cell_position) == "X" || position(cell_position) == "O"
  end 
    
  def valid_move?(input)
    input = input.to_i 
    !(taken?(input)) && input.between?(1, 9)
  end 
  
  
  
end 
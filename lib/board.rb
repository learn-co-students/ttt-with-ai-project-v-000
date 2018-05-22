'require pry'

class Board
  
  attr_accessor :cells
  
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end 
  
  def initialize(cells = nil)
    @cells = cells || Array.new(9, " ")
  end
 
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
   input = input.to_i 
   @cells[input - 1]
  end
 
  def taken?(input)
    position(input) == "X" || position(input) == "O" 
  end

  def valid_move?(input)
    input = input.to_i
    input.between?(1,9) && !(taken?(input))
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  def full?
    @cells.all? do |full_array|
    full_array == "X" || full_array == "O"
   end
  end
 
  def update(input, player) 
    input = input.to_i
    cells[input -1] = player.token
   end 
  end
 

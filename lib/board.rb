
class Board 
  
  attr_accessor :cells
  
  def initialize
    reset!
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
  
  def position(input)
    index = input.to_i - 1 
    @cells[index]
  end
  
  def full?
    if @cells.include?(" ") == FALSE
      true
    end
  end
  
  def turn_count
    @cells.count {|square| square != " "}
  end
  
  def taken?(input)
    self.position(input) != " "
  end
  
  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !taken?(input)
  end
  
  def update(input, player)
    index = input.to_i - 1 
    @cells[index] = player.token
  end
    
  
end


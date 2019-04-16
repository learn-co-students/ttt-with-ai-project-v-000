class Board
  attr_accessor :cells
  
  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
    
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def position(position)
    index = input_to_index(position)
    @cells[index]
  end
  
  def update(position, player)
    index = input_to_index(position)
    @cells[index] = player.token
  end
  
  def full?
    @cells.all?{|index| index != " " }
  end
  
  def turn_count
    @cells.count{|index| index != " " }
  end
  
  def taken?(position)
    index = input_to_index(position)
    @cells[index] != " "
  end
  
  def valid_move?(position)
    index = input_to_index(position)
    !taken?(position) && index.between?(0,8)
  end
  
end
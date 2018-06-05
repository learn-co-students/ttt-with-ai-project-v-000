

class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" "] * 9
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    ix = input.to_i - 1
    @cells[ix]
  end
  
  def taken?(location)
    loc = position(location)
    loc == "X" || loc == "O"
  end
  
  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end
  
  def full?
    ! (@cells.any?{|cell| cell == " " })
  end
  
  def reset!
    @cells = [" "] * 9
  end
  
  def turn_count
    moves = @cells.select{|i| i == "X" || i == "O"}
    moves.length
  end
  
  def update(input, player)
    position = input.to_i - 1
    @cells[position] = player.token
  end
  
end
class Board
  attr_accessor :cells
  
  def initialize()
    reset!
  end
  
  def reset!
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(new_move)
    cells[new_move.to_i-1]
  end
  
  def full?
    # what is a full board? i board that has X or O in all the cells
    cells.all? {|cell| cell == "X" || cell == "O"}
  end
  
  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end
  
  def taken?(position)
    cells[position.to_i-1] == "X" || cells[position.to_i-1] == "O"
  end
  
  def valid_move?(move)
    !taken?(move) && move.to_i.between?(1,9)
  end
  
  def update(move, player)
    cells[move.to_i-1] = player.token
  end
  
      
end
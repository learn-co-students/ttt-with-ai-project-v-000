class Board
  attr_accessor :cells
  
  def initialize
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
  
  def position(pos)
    @cells[pos.to_i-1]
  end
  
  def full?
    @cells.all?{|x| x == "X" || x == "O"}
  end
  
  def turn_count
    # returns the amount of turns based on cell value
    @cells.count{|x| x == "X" || x == "O"}
  end
  
  def taken?(pos)
    #returns true if the position is X or O'
    #if position{|x| x == "X" || x == "O"} true
    if @cells[pos.to_i - 1] == "X" || @cells[pos.to_i - 1] == "O"
    return true
    else
    return false
    end
  end
  
  def valid_move?(pos)
    # if taken is false and pos.to_i-1 is between 0 - 9, then the move is valid
     !taken?(pos) && (pos.to_i > 0 && pos.to_i < 10)
  end

  def update(pos,  player)
    @cells[pos.to_i - 1] = player.token
  end
end
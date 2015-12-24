
class Board
  attr_accessor :cells, :turn_count

  def initialize
    @cells = Array.new(9, " ")
    @turn_count = 0
  end

  def display
    puts " #{cells[0]} |" + " #{cells[1]} |" + " #{cells[2]} \n-----------\n"
    puts " #{cells[3]} |" + " #{cells[4]} |" + " #{cells[5]} \n-----------\n"
    puts " #{cells[6]} |" + " #{cells[7]} |" + " #{cells[8]} \n-----------\n"
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(move)
    @cells[move.to_i - 1]
  end

  def full?
    cells.none?{|c| c == " "}
  end

  def taken?(move)
    cells[move.to_i - 1] != " "
  end

  def valid_move?(move)
    (1..9).include?(move.to_i) && !taken?(move)
  end

  def update(move, player)
    @cells[move.to_i - 1] = player.token
    @cells
  end

  def turn_count
    cells.select{|c| c != " "}.size 
  end

end
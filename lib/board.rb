class Board
  attr_accessor :cells


  def initialize
    self.reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(move)
      cells[move.to_i-1] unless (move.to_i <= 0 || move.to_i > 9)
  end

  def update(move, player)
    cells[move.to_i-1] = player.token if position(move)
  end

  def full?
    cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(move)
    position(move) == "X" || position(move) == "O"
  end

  def valid_move?(move)
    position(move) && !taken?(move)
  end

end
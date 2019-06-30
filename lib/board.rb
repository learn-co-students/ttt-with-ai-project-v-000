class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(index)
    cells[index.to_i - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(index)
    position(index) == "X" || position(index) == "O"
  end

  def valid_move?(move)
    move.to_i.between?(1, 9) && !taken?(move)
  end

  def update(index, player)
    cells[index.to_i - 1] = player.token
  end
end

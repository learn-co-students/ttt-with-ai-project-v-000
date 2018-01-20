class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def position(pos)
    @cells[pos.to_i-1]
  end

  def full?
    true if !@cells.include?(" ")
  end

  def turn_count
    @cells.select { |c| c != " "}.size
  end

  def taken?(pos)
    !!(position(pos) != " ")
  end

  def valid_move?(pos)
    !!(pos.to_i.between?(1, 9) && !taken?(pos))
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token
  end
end

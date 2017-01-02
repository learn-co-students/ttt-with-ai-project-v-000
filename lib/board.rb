class Board
  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts ""
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts ""
  end

  def position(move)
    cells[move.to_i - 1]
  end

  def full?
    cells.all? { |cell| cell != " " }
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(move)
    position(move) != " "
  end

  def valid_move?(move)
    !taken?(move) && move.to_i.between?(1,9)
  end

  def update(move, player)
    if valid_move?(move)
      cells[move.to_i - 1] = player.token
    end
  end

end

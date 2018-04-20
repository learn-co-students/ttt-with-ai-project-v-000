
class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    self.reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(move)
    return "#{cells[move.to_i - 1]}"
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(move)
    if position(move) == "X" || position(move) == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position.to_i.between?(1, 9) && !taken?(position.to_i)
      true
    else false
    end
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
    display
  end

end

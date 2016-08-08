class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
    @cells[pos.to_i - 1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(pos)
    position(pos) == "X" || position(pos) == "O"
  end

  def valid_move?(pos)
    if (1..9).cover?(pos.to_i)
      !taken?(pos)
    else
      false
    end
  end

  def update(pos, player)
    @cells[pos.to_i - 1] = player.token
  end

end
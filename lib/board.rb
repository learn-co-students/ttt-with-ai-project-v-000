class Board
  attr_accessor :cells

  def initialize
    @cells = []
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
    cells[pos.to_i - 1]
  end

  def full?
    cells.all? { |n| n == "X" || n == "O"}
  end

  def turn_count
    cells.count { |n| n == "X" || n == "O" }
  end

  def taken?(pos)
    cells[pos.to_i - 1] == "X" || cells[pos.to_i - 1] == "O"
  end

  def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken?(pos)
  end

  def update(cell, player)
    cells[cell.to_i - 1] = player.token
    puts ""
    puts "***********"
    puts ""
    display
  end
end

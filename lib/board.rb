require "pry"

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells.clear
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{self.cells[0]} ""|"" #{self.cells[1]} ""|"" #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} ""|"" #{self.cells[4]} ""|"" #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} ""|"" #{self.cells[7]} ""|"" #{self.cells[8]} "
  end

  def position(board)
    @cells[board.to_i - 1]
  end
  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  def taken?(position)
    !(@cells[position.to_i - 1].nil? || @cells[position.to_i - 1] == " ")
  end
  def valid_move?(position)
    return if (position.to_i - 1 < 0)
    !taken?(position)
  end
  def update(position, player)
    @cells[position.to_i-1] = player.token
  end
end
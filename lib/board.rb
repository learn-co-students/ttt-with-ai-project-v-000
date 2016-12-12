require 'pry'
class Board
  attr_accessor :board, :cells, :token

  def initialize
    reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(square)
    cells[square.to_i - 1]
  end

  def full?
    self.cells.all? {|s| s == "X" || s == "O"}
  end

  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(square)
    self.position(square) != " "
  end

  def valid_move?(square)
    square.to_i.between?(1,9) and !self.taken?(square)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end

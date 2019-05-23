require 'pry'

class Board
  attr_accessor :cells

  @@cells = []

  def self.cells
    @@cells
  end

  def self.cells=
    @@cells << Array.new(cells)
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(user_input)
    self.cells[user_input.to_i - 1]
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.count("X") + self.cells.count("O")
  end

  def taken?(user_input)
    self.cells[user_input.to_i - 1] == "X" || self.cells[user_input.to_i - 1] == "O"
  end

  def valid_move?(position)
    !taken?(position.to_i) && position.to_i > 0 && position.to_i <= 9
  end

  def update(position, player)
    self.cells[position.to_i - 1] = player.token
  end

end

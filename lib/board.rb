require 'pry'
class Board
  attr_accessor :cells

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

  def position(input)
    i = input.to_i - 1
    cells[i]
  end

  def full?
    self.cells.all? {|index| index != " "}
  end

  def turn_count
    self.cells.count {|index| index != " "}
  end

  def taken?(input)
    i = input.to_i - 1
    self.cells[i] != " "
  end

  def valid_move?(input)
    i = input.to_i - 1
    i.between?(0, 8) && self.cells[i] == " "
  end

  def update(input, player)
    i = input.to_i - 1
    self.cells[i] = player.token
  end

  # def input_to_index(input)
  #   input.to_i - 1
  # end

end

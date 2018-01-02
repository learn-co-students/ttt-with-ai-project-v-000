require 'pry'
class Board
  attr_accessor :cells
  @@cells = []

  def initialize
    self.cells = Array.new(9, " ")
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
    puts ""
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    self.cells[input.to_i-1] != " "
  end

  def valid_move?(input)
    input.to_i >= 1 && input.to_i <= 9 && !taken?(input)
  end

  def update(position, player)
    self.cells[position.to_i-1] = player.token
  end






end

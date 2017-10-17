require 'pry'

class Board
  attr_accessor :cells

  def reset!
    self.cells.clear
    self.cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(number)
    self.cells[number.to_i - 1]
  end

  def full?
    self.cells.none? { |cell| cell == " " }
  end

  def turn_count
    self.cells.count { |cell| cell != " " }
  end

  def taken?(number)
    position(number) != " "
  end

  def valid_move?(number)
    (1..9).include?(number.to_i) && !taken?(number)
  end

  def update(number, player)
    self.cells[number.to_i - 1] = player.token
  end
end

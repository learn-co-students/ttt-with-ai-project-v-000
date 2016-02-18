require "pry"
class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
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
    self.cells.none? { |cell| cell == " "}
  end

  def turn_count
    self.cells.count { |cell| cell != " " }
  end

  def taken?(position_number)
    self.position(position_number) != " "
  end

  def valid_move?(position_number)
    position_number.to_i.between?(1,9) && !self.taken?(position_number)
  end

  def update(position_number, player)
    # self.position(position_number) = player.token 
    # why does this work when I type out the position method, but not now?
  end
end
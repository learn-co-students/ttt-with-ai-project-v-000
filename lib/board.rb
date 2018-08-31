require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9," ")
  end

  def display
    puts "-----------"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "---|---|---"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "---|---|---"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "-----------"
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token
  end

  def full?
    !self.cells.include?(" " || "")
  end

  def turn_count
    self.cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)
    if input.to_i != 0
      return true if taken?(input) == false && ((input.to_i) - 1).between?(0,8)
    end
  end

  def reset!
    self.cells = Array.new(9, " ")
  end
end

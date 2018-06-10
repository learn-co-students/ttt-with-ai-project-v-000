require 'pry'

class Board
  attr_accessor :cells

  def initialize
    self.reset!
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
    self.cells[input.to_i-1]
  end

  # SHOULD ALL BELOW METHODS BE USING #POSITION?

  def full?
    self.cells.all? { |i| i == "X" || i == "O" }
  end

  def turn_count
    self.cells.count { |i| i == "X" || i == "O" }
  end

  def taken?(input)
    self.position(input) == "X" || self.position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && self.taken?(input) == false
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[input.to_i-1] = player.token
      # WHY DOESN'T THE BELOW WORK?
      # self.position(input) = player.token
    end
  end

end

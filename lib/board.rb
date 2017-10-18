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

  def position(user_input)
    cells[user_input.to_i - 1]
  end

  def full?  # should this method check for "X"s and "O"s specifically? or just empty spaces?
    cells.none? { |position| position == " "}
  end

  def turn_count
    cells.select { |position| position != " "}.count
  end

  def taken?(user_input)
    self.position(user_input) != " "
  end

  def valid_move?(user_input)
    (1...9).include?(user_input.to_i) && !self.taken?(user_input)
  end

  def update(user_input, token)  #must fix, won't work till Player.token is set.
    binding.pry
    self.cells[user_input.to_i-1] = token
  end
end

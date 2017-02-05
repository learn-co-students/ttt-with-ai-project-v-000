require 'pry'

class Board
attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def reset!
    cells.clear
    initialize
  end

  def position(user_input)
    self.cells[user_input.to_i - 1]
  end

  def full?
    !self.cells.include? " "
  end

  def turn_count
    self.cells.count { |x| x == "X" || x == "O" }
  end

  def taken?(user_input)
    !(self.cells[user_input.to_i - 1].nil? || self.cells[user_input.to_i - 1] == " ")
  end

  def valid_move?(user_input)
    position(user_input.to_i).between?(0,8) && !taken?(user_input)
  end
end

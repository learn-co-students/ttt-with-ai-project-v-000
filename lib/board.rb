require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "-----------"
  end

  def position(user_input)
    user_input_int = user_input.to_i
    self.cells[user_input_int - 1]
  end

  def full?
    self.cells.all?{|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    self.cells.select {|cell| cell == "X" || cell == "O"}.size
  end

  def taken?(position)
    self.position(position) == "X" || self.position(position) == "O"
  end

  def valid_move?(position)
    if position.to_i.between?(1, 9)
      !self.taken?(position)
    else
      false
    end
  end

  def update(user_input, player)
    self.cells[user_input.to_i - 1] = player.token
  end
end

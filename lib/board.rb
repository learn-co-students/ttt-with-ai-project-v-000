require "pry"

class Board
  attr_accessor :cells

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts "\n"
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    puts "\n"
    puts "\n"
  end

  def position_to_index(position)
    position.to_i - 1
  end

  def position(position)
    if position.to_i >= 1 && position.to_i <= 9
      index = self.position_to_index(position)
      self.cells[index]
    end
  end

  def update(position, player)
    index = self.position_to_index(position)
    self.cells[index] = player.token
  end

  def full?
    self.cells.none? {|cell| cell == " "}
  end

  def turn_count
    turns = self.cells.find_all {|cell| cell != " "}
    turns.length
  end

  def taken?(position)
    self.position(position) != " "
  end

  def valid_move?(position)
    self.position(position) == " "
  end

end

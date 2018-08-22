require 'pry'

class Board
  attr_accessor :cells

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    self.cells.include?("X") && self.cells.include?("O") if !self.cells.include?(" ")
  end

  def turn_count
    counter = 0
    self.cells.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    return counter
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    index = input.to_i - 1
    self.cells[index] = player.token if valid_move?(input)
  end

end

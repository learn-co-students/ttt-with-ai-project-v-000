require 'pry'

class Board
  attr_accessor :cells

  def initialize
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(position)
    index = position.to_i - 1
    cells[index]
  end

  def full?
    cells.none? {|position| position == " "}
  end

  def turn_count
    n = 0
    cells.each do |position|
      n += 1 if position != " "
    end
    n
  end

  def taken?(position)
    cells[position.to_i - 1] != " "
  end

  def valid_move?(position)
    position.to_i >= 1 && position.to_i <= 9 && taken?(position) == false
  end

  def update(position, player)
    cells[position.to_i - 1] = player.token
  end

end

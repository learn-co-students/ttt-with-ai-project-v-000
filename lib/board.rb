require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}    "
    puts "----------- "
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}    "
    puts "----------- "
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}    "

  end

  def position(selection)
    cells[selection.to_i-1]
  end

  def full?
    cells.all? { |position| position != " " }
  end

  def turn_count
    count = 0
    cells.each { |position| count += 1 if position != " "}
    count
  end

  def taken?(position)
    cells[position.to_i - 1] != " "
  end

  def valid_move?(move)
    options = (1..9).map {|number| number.to_s}
    options.include?(move) && !taken?(move)
  end

  def update(move, player)
    self.cells[move.to_i-1] = player.token
  end
end

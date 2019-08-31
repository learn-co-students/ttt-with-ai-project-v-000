require 'pry'

class Board
attr_accessor :cells, :board

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    !@cells.any? {|i| i == " "}
  end

  def turn_count
    @cells.count {|i| i != " "}
  end

  def taken?(input)
    index = input.to_i - 1
    @cells[index] != " "
  end

  def valid_move?(input)
    !self.taken?(input) && input.to_i.between?(1,9)
  end

  def update(num, player)
    index = num.to_i - 1
    @cells[index] = player.token
  end

end

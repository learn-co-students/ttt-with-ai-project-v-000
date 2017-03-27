require 'pry'

class Board

  attr_accessor :cells

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
    @cells[index]
  end

  def full?
    full_board = @cells.include?(" ")
    !full_board
  end

  def turn_count
    count = 0
    @cells.each {|cell| count += 1 if cell == "X" || cell == "O" }
    count
  end

  def taken?(position)
    index = position.to_i - 1
    @cells[index] == "X" || @cells[index] == "O"
  end

  def valid_move?(input)
    index = input.to_i
    index.between?(1,9) && !taken?(index)
  end

  def update(position, player)
    index = position.to_i - 1
    self.cells[index] = player.token
  end

end

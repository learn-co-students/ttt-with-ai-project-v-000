
require 'pry'
class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(space)
    input = space.to_i
    @cells[input - 1]
  end

  def update(position,player)
    input = position.to_i
    @cells[input-1] = player.token
  end

  def full?
    cells.all? do |cell_value|
        cell_value == 'X' || cell_value == 'O'
    end
  end

  def turn_count
    cells.count do |cell_value|
        cell_value == 'X' || cell_value == 'O'
    end
  end

  def taken?(space)
    cell = space.to_i
    if @cells[cell-1] == "X" || @cells[cell-1] == "O"
      return true
    else @cells[cell-1] == nil || @cells[cell-1] == " "
      return false
    end
  end

  def valid_move?(input)
    position = input.to_i
    if position.between?(1, 9) && !taken?(position)
      return true
    end
  end

end

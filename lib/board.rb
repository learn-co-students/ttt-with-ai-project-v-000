require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all? { |cell| cell == "X" || cell == "O" }
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(cell)
    the_cell = position(cell)
    if the_cell == "X" || the_cell == "O"
      true
    elsif the_cell == " "
      false
    else
      false
    end
  end

  def valid_move?(cell)
    if cell.to_i > 0 && cell.to_i < 10 && !taken?(cell)
      true
    else
      false
    end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
end

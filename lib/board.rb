require 'pry'

class Board

  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(cell_number)
    cells.detect.with_index  {|cell, index| cell_number.to_i - 1 == index}
  end

  def full?
    cells.all? {|cell| cell != " "}
  end

  def turn_count
    cells.count("X") + cells.count("O")
  end

  def taken?(cell_number)
    if position(cell_number) == "X" || position(cell_number) == "O"
      true
    elsif position(cell_number) == " "
      false
    end
  end

  def valid_move?(cell_number)
    !taken?(cell_number) && cell_number.to_i.between?(1,9)
  end

  def update(cell_number, player)
    cells[cell_number.to_i - 1] = player.token
  end

end

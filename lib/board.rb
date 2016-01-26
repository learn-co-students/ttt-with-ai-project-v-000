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
    puts "------------"
    puts " #{@cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "------------"
    puts " #{@cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "------------"
    puts " #{@cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "------------"
  end

  def position(cell)
    self.cells[cell.to_i - 1]
  end

  def cell_taken?(cell)
    cell == "X" || cell == "O"
  end

  def taken?(number)
    cell_taken?(self.cells[number.to_i - 1])
  end

  def full?
    self.cells.all?{|cell| cell_taken?(cell)}
  end

  def turn_count
    count = 0
    self.cells.each do |cell|
      count += 1 if cell_taken?(cell)
    end
    count
  end

  def valid_move?(cell)
    cell_taken?(self.cells[cell.to_i - 1]) == false && cell.to_i.between?(1, 9)
  end

  def update(cell, player)
    cells[cell.to_i - 1] = player.token
  end
end

require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")

  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(cell)
    cells[cell.to_i-1]
  end

  def full?
    !@cells.include?(" ")
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(cell)
    location = cell.to_i - 1
    !(cells[location].nil? || cells[location] == " ")
  end

  def valid_move?(cell)
    cell.to_i.between?(1,9) && !taken?(cell)
  end

  def update(cell, player)
    cells[(cell.to_i - 1)] = player.token if valid_move?(cell)
  end
end

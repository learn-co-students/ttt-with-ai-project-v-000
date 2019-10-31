require 'pry'

class Board
  attr_accessor :cells

  def initialize
    self.cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    cells[input_to_index(input)]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    cells.collect{|c| c if c != " "}.delete_if{|c| c == nil}.count
  end

  def taken?(input)
    cells[input_to_index(input)] != " "
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input_to_index(input)] = player.token
  end

  def input_to_index(input)
    input.to_i - 1
  end


end

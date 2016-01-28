require_relative '../lib/game.rb'
require_relative '../lib/players/computer.rb'
require_relative '../lib/players/human.rb'
require_relative '../lib/board.rb'

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

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.select {|cell| cell == " "}.empty?
  end

  def turn_count
    cells.count {|cell| cell != " "}
  end

  def taken?(position)
    cells[(position.to_i - 1)] != " " ? true : false
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && taken?(position) == false ? true : false
  end
  
  def update(cell, player)
    cells[(cell.to_i - 1)] = player.token
    display
  end

end
require_relative '../config/environment.rb'
require 'pry'
class Board

  attr_accessor :cells, :board

  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end

  def initialize
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-------------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-------------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    index = input.to_i - 1
    self.cells[index]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    cells.count do |turn|
      turn != " "
    end
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    !taken?(input) && input.to_i.between?(1,9)
  end

  def update(input, player = "X")
    self.cells[input.to_i - 1] = player.token
  end

end#end of class

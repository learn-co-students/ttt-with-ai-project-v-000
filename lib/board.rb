require "pry"
class Board
  attr_accessor :cells

  def initialize
    self.cells= Array.new(9, " ")
  end

  def reset!
    self.cells=Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    # binding.pry

  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    self.cells.count {|x| x!=" "}
  end

  def taken?(input)
    position(input)!=" "
  end

  def valid_move?(input)
    input.to_i >=1 && input.to_i <=9 && taken?(input)==false
  end

  def update(input, player)
    cells[input.to_i-1]=player.token
  end


end

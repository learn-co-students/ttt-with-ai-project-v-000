require 'pry'
class Board

  attr_accessor :cells

  def initialize
    self.cells = Array.new(9," ")
  end

  def reset!
    self.cells = Array.new(9," ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    num = num.to_i
    cells[num-1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(num)
    num = num.to_i
    cells[num - 1] != " "
  end

  def valid_move?(num)
    if !self.taken?(num) && num.to_i.between?(1,9)
      true
    else
      false
    end
  end

  def update(num,player)
    num = num.to_i - 1
    cells[num] = player.token
  end


end

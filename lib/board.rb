require 'pry'
class Board
  attr_accessor :cells

  def reset!
    cells.clear
    self.cells = Array.new(9," ")
  end

  def initialize
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
    self.cells[input.to_i-1]
  end

  def full?
    if !self.cells.include?(" ")
      true
    else
      false
    end
  end

  def turn_count
    empty = self.cells.count(" ")
    9 - empty
  end

  def taken?(board)
    if self.cells[board.to_i-1] != " "
      true
    else
       false
    end
  end

  def valid_move?(board)
    #binding.pry
    if taken?(board.to_i)
      false
    else
      true && board.to_i.between?(1,9)
    end
  end

  def update(board, player)
    cells[board.to_i-1] = player.token
  end
end

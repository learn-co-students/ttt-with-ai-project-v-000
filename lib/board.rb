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
    cells[input.to_i-1]
  end

  def full?
    !cells.include? " "
  end

  def turn_count
    cells.select{|cell| (cell == "X" || cell == "O")}.length
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
  end

  def valid_move?(input)
    check = input.to_i
    ((1..9).to_a.include? check) && !taken?(check)
  end

  def update(pos, player)
    if valid_move?(pos.to_i)
      cells[pos.to_i - 1] = player.token
    end
  end
end

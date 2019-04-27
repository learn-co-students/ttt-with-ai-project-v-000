require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    puts
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    @cells[input.to_i - 1]
  end

  def full?
  @cells.all? { |cell| cell != " " }
  end

  def turn_count
    9 - @cells.count(" ")
  end

  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end

  def valid_move?(move)
    @cells[move.to_i - 1] == " " && move.to_i >=1 && move.to_i <= 9
  end

  def update(move, player)
    token = player.token
    @cells[move.to_i - 1] = token
  end
end

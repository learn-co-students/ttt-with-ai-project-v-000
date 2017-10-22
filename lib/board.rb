require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def cells
    @cells
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
    cells[input.to_i - 1]
  end

  def full?
    cells.any? {|e| e == " "} ? false : true
  end

  def turn_count
    turn_num = cells.select {|e| e != " "}
    turn_num.count
  end

  def taken?(input)
    cells[input.to_i - 1] != " " ? true : false
  end

  def valid_move?(input)
    if input.to_i >= 1 && input.to_i <= 9 && !taken?(input)
      true
    end
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end
end

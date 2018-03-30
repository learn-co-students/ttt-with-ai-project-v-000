require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def reset!
    cells.clear
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(num)
    cells[num.to_i-1]
  end

  def full?
    if cells.include?(" ")
      return false
    else
      return true
    end
  end

  def turn_count
    count = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def taken?(num)
    if position(num.to_i) == "X" || position(num.to_i) == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(num)
    if (1..9).include?(num.to_i) && taken?(num) == false
      return true
    else
      return false
    end
  end

  def update(num, player)
      cells[num.to_i - 1] = player.token
  end

end

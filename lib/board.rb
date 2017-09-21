require 'pry'

class Board

  attr_accessor :cells

  def initialize
    @cells = []
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]}  "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]}  "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]}  "
  end

  def position(input)
    index = input.to_i - 1
    cells[index]
  end

  def full?
    cells.each do |cell|
      if cell == " " || cell == nil || cell == ""
        return false
      else
        true
      end
    end
  end

  def turn_count
    cells.select { |cell| cell == "X" || cell == "O" }.count
  end

  def taken?(input)
    if position(input) == "X" || position(input) == "O"
      true
    else
      false
    end
  end
end

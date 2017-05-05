require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts" #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts"-----------"
    puts" #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts"-----------"
    puts" #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def to_index(input)
    input.to_i - 1
  end

  def position(input) # converts user position input into index value and return the cell of that position
    @cells[input.to_i-1]
  end

  def full?
    if @cells.include?(" ")
      false
    else
      true
    end
  end

  def turn_count
    @turn_number = 0
    @cells.each do |cell|
      if cell == "X" or cell == "O"
        @turn_number += 1
      end
    end
      return @turn_number
  end

  def taken?(cell)
    if @cells[to_index(cell)] != " "
      true
    else
      false
    end
  end

  def valid_move?(cell)
    if taken?(cell) == false && cell.to_i.between?(1,9)
      true
    else
      false
    end
  end

  def update(input,player="X")
    cells[input.to_i-1] = player.token
  end
end

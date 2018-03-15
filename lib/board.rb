require 'pry'
class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")
  end

  def cells
    @cells
  end

  def reset!
    cells.clear
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    self.cells[num.to_i - 1]
  end

  def full?
    cells.all? do |token|
      token == "X" || token == "O"
    end
  end

  def turn_count
    i = 0
    counter= 0
      while i < cells.count
        if cells[i] == "X" || cells[i] == "O"
          counter += 1
        end
      i += 1
    end
    return counter
  end

  def taken?(num)
     if position(num) == "X" || position(num) == "O"
       true
     else
       false
     end
   end

  def valid_move?(num)

  end


end

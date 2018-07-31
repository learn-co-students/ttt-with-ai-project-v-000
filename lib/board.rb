require 'pry'

class Board
  def cells=(cells)
    @cells = cells
  end

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " ----------- "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " ----------- "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
     cells.all? do |cell|
      if cell != " "
        true
      end
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

  def taken?(index)
    if self.position(user_input) == "X" || self.postion(user_input) == "O"
      true
    end
  end
end

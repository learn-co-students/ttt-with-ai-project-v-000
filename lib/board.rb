require 'pry'

class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
    self.cells[(input.to_i)-1]
  end
  
  def full?
		if cells.detect {|cell| cell == " " }
			false
		else 
			true
    end
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  def taken?(input)
    result = position(input)
    if result == "X" || result == "O"; true
      else false
    end
  end

  def valid_move?(input)
    (input.to_i > 0 && input.to_i < 10) && (taken?(input.to_i) == false)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end

require 'pry'

class Board
  attr_accessor :cells

  def initialize 
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    dash = "-" * 11
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} }"
    puts dash
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} }"
    puts dash
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} }"
  end

  def position(input)
    cells[input.to_i-1]
  end

  def full?
    cells.all? { |cell| cell != " "  }
  end

  def turn_count
    cells.count { |cell| cell != " " }
  end

  def taken?(position)
    cells[position.to_i-1] != " "
  end

  def valid_move?(input)
    numbers = (0..8)
    !taken?(input) && numbers.include?(input.to_i-1)
  end

  def update(input, player)
    cells[input.to_i-1] = player.token
  end
end

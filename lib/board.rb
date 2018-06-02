require 'pry'

class Board

  attr_accessor :cells

  def reset!
    @cells = Array.new(9, " ")
#binding.pry
  end

  def initialize
    reset!
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(input)
  #binding.pry
    cells[input.to_i - 1]
  end

  def full?
    if cells.detect { |cell| cell.include?(" ") }
      false
    else
      true
    end
  end

  def turn_count
    #binding.pry
    cells.count { |cell| cell == "X" || cell == "O" }
  end

  def taken?(input)
    position(input) == "X" || position(input) == "O"
end

  def valid_move?(input)
  #  binding.pry
    if input.to_i.between?(1,9) && !taken?(input)
    true
  else
    false
  end
  end

  def update(input, player)
  #  binding.pry
  cells[input.to_i - 1] = player.token
  end

end

class Board
  require 'pry'

  attr_accessor :cells

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    cells[input.to_i-1]
  end

  def position_taken?(input)
    if cells[input.to_i-1] == " " 
      return false
    else 
      return true
    end
  end

  def full?
    @cells.all? {|position| position == "X" || position == "O"}
  end

  def turn_count
    @cells.count {|position| position != " "}
  end

  def taken?(input)
    if cells[input.to_i - 1] != " " 
      return true
    else 
      return false
    end
  end

  def valid_move?(input)
    if taken?(input) == false && input.to_i.between?(1,9) == true
      return true
    else 
      return false
  end
end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end
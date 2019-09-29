require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells = Array.new(9," ")
  end
  def reset!
    @cells = Array.new(9, " ")
  end
  def display
    puts ("1| [#{cells[0]}] |2| [#{cells[1]}] |3| [#{cells[2]}] ")
    puts ("----------------------")
    puts ("4| [#{cells[3]}] |5| [#{cells[4]}] |6| [#{cells[5]}] ")
    puts ("----------------------")
    puts ("7| [#{cells[6]}] |8| [#{cells[7]}] |9| [#{cells[8]}] ")
  end

  def position(input)
    index = input.to_i - 1
    @cells[index]
  end
  def full?
    @cells.all? {|token| token == "X" || token == "O"}
  end
  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  def taken?(position)
    @cells[position.to_i - 1] == "X" || @cells[position.to_i - 1] == "O"
  end
  def valid_move?(position)
    index = position.to_i - 1
    if index.between?(0, 8) && !taken?(position)
      true
    end
  end
  def update(position, player)
    index = position.to_i - 1
    @cells[index] = player.token
  end

end

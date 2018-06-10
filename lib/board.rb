class Board

  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    input = input.to_i
    cells[input - 1]
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.count(" ")
  end

  def taken?(input)
    position(input) != " "
  end

  def valid_move?(input)
    (1..9).include?(input.to_i) && !taken?(input)
  end

  def update(move, player)
    cells[move.to_i - 1] = player.token
  end
end

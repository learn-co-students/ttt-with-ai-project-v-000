class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def position(input)
    input = input.to_i
    cells[input - 1]
  end
  def full?
    cells.none? {|position| position == " " || position == nil}
  end
  def turn_count
    turn = 0
    cells.each {|position| turn += 1 if position == "X" || position == "O"}
    turn
  end
  def taken?(position)
    position = position.to_i - 1
    cells[position] == "X" || cells[position] == "O"
  end
  def valid_move?(position)
    position = position.to_i
    !(taken?(position)) && position.between?(1, 9)
  end
  def update(position, player)
    position = position.to_i
    cells[position -1] = player.token
  end
end

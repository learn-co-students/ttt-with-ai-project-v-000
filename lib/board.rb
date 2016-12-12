require 'pry'

class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    puts " "
  end

  def position(board_position)
    index = board_position.to_i - 1
    @cells[index]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count
    @cells.count { |cell| cell == "X" || cell == "O"}
  end

  def taken?(board_position)
    position(board_position) != " "
  end

  def valid_move?(board_position)
    board_position.to_i.between?(1, 9) && !taken?(board_position)
  end

  def update(board_position, player)
     @cells[board_position.to_i - 1] = player.token
  end
#binding.pry
end

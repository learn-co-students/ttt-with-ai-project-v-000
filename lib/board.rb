#
# NOTE: board locations are from 1 to 9 and
#       correspond to @cells indexes 0 to 8.

class Board
  attr_accessor :cells

  def initialize
    new_board
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts '-----------'
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts '-----------'
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def full?
    !@cells.include?(' ')
  end

  def move(board_location, current_player)
    @cells[board_location.to_i-1] = current_player.token
  end

  def position(board_location)
    @cells[board_location.to_i-1]
  end

  def reset!
    new_board
  end

  def taken?(board_location)
    @cells[board_location.to_i-1] != ' '
  end

  def turn_count
    @cells.count { |cell| cell != ' '}
  end

  def update(board_location, player)
    @cells[board_location.to_i-1] = player.token
  end

  def valid_move?(board_location)
    ((1..9).include?board_location.to_i) && (!taken?(board_location))
  end

  private
  def new_board
    @cells = Array.new(9, ' ')
  end
end

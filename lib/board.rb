require 'pry'
class Board
  @cells = []
  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  def cells
    @cells
  end
  def cells=(array)
    @cells = array
  end
  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  def position(input)
    @cells[input.to_i-1]
  end
  def full?
    select_if_empty = @cells.select { |cell| cell == " " }
    select_if_empty == [] ? (true) : (false)
  end
  def turn_count
    select_if_empty = @cells.select { |cell| cell == " " }
    9-select_if_empty.length  
  end
  def taken?(position_number)
    self.position(position_number) == " " ? false : true
  end
  def valid_move?(move)
    move.to_i.between?(1, 9) && self.taken?(move) == false
  end
  def update(position_number, player)
    @cells[position_number.to_i-1] = player.token
  end
end
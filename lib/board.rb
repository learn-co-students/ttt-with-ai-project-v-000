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
    self.position(board_position) != " "
  end

  def valid_move?(board_position)
    valid_positions = (1..9).to_a.map{|n| n.to_s}
    valid_positions.include?(board_position) && !taken?(board_position)
  end

  def update(board_position, player)
     @cells[board_position.to_i - 1] = "X"
     #needs to be changed later  player = double("player", :token => "X")
  end
#binding.pry
end

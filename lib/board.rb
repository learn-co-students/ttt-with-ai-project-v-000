require 'pry'
class Board
#@cells = []
# = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

  def position(user_input)
    cells[user_input.to_i-1]
  end

  def full?
    cells.all? {|token| token != " "}
  end

  def turn_count
    cells.count {|token| token != " "}
  end

  def taken?(user_input)
    position(user_input) != " "
  end

  def valid_move?(user_input)
    !taken?(user_input) && user_input.to_i.between?(1, 9)
  end

  def update(user_input, player)
    cells[user_input.to_i-1] = player.token
  end

end

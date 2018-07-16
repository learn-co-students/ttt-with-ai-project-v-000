require 'pry'
class Board
  attr_accessor :cells

  def cells
    @cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def initialize
    reset!
  end

  def display
    print " #{cells[0]} | #{cells[1]} | #{cells[2]} \n-----------\n #{cells[3]} | #{cells[4]} | #{cells[5]} \n-----------\n #{cells[6]} | #{cells[7]} | #{cells[8]} \n"
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    cells.count {|token| token == "X" || token == "O"}
  end

  def taken?(user_input)
    position(user_input) == "X" || position(user_input) == "O"
  end

  def valid_move?(user_input)
    (user_input.to_i).between?(1, 9) && !taken?(user_input)
  end

  def update(user_input, player)
    @cells[user_input.to_i - 1] = player.token
    display
  end




end

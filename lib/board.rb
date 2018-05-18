require "pry"
class Board
  attr_accessor :cells


  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? {|i| i == "X" || i == "O"}
  end

  def turn_count
    @cells.count {|cell| cell == "X" || cell == "O"}
  end

  def taken?(user_input)
    if position(user_input) == "X" || position(user_input) == "O"
      true
    else
      false
    end
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9) && !taken?(user_input)

  end

  def update(position, player)
    @cells[position.to_i - 1] = player.token
  end
end

require 'pry'
class Board
  attr_accessor :cells

  # here is a comment from jonathan

  def initialize
    reset!
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

  def position(user_input)
   input = user_input.to_i - 1
    @cells[input]
  end


  def full?
    @cells.all? {|cell| cell != " "}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(spot)
    index = spot.to_i - 1
    @cells[index] != "" && @cells[index] != " "
    # if statement reduced to one line since return value is a simple boolean
  end

  def valid_move?(user_input)
    input = user_input.to_i - 1
    if input.between?(0,8) && !taken?(user_input)
    true
    end
  end

  def update(user_input, player) # update the board with the move
    input = user_input.to_i - 1
    @cells[input] = player.token
  end
end

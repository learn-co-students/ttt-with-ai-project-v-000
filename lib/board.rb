require 'pry'
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

  def position(user_input)
    @cells[user_input.to_i - 1]
  end


  def taken?(user_input)
    @cells[user_input.to_i - 1] == "X" || @cells[user_input.to_i - 1] == "O"
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1, 9)  &&  !taken?(user_input)
  end

  def update(user_input, player)
    #ask, how do I think about this? connect the token/player, with the move
    # cells[] = that player's token
    @cells[user_input.to_i - 1] = player.token
  end

  def full?
    # @cells.any?{|c| c != " "} # ask why doesn't this work?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{ |token| token == "X" || token == "O"}
  end

end

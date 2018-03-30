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
    @cells[user_input.to_i-1]
  end

  def full?
    @cells.all? {|cell| cell == "X" || cell == "O"}
  end

  def turn_count  #how many x's and O's, will be the turns done.
    @cells.count("X") + @cells.count("O")
  end

  def taken?(spot)
    @cells[spot.to_i-1] == "X" || @cells[spot.to_i-1] == "O"
  end

  def valid_move?(spot)
    !taken?(spot) && spot.to_i.between?(1,9)
  end

  def update(spot, current_player)
    if valid_move?(spot)
      if turn_count%2 == 0
        @cells[spot.to_i-1] = current_player.token
      else
        @cells[spot.to_i-1] = current_player.token
      end
      display
    else
      "Not a valid move"
    end
  end


end

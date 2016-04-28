require "pry"
require_relative "../../config/environment.rb"

class Player::Computer < Player

  def move(board)
    if !board.taken?("5") #Checks if the middle is taken
      "5" #if it isn't then it goes for the center
    elsif
      corners(board)
    else
      rand(1..9)
    end
  end

  def corners(board)
    [1, 3, 7, 9].detect {|cell| !board.taken?(cell)}
  end

end

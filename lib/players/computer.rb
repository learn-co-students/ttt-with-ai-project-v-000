require "pry"
require_relative "../../config/environment.rb"

class Computer < Player

  def move(board)
    if !board.taken?("5")
      5
    else
      rand(1..9)
    end
  end

end

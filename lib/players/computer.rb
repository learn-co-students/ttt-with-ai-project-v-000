require 'pry'
module Players
  class Computer < Player

    def move(board)
      if !@board.taken?("5")
        "5"
      elsif !@board.taken?("1")
        "1"  
      end
    end


  end
end



      #First move takes center if availabe if not take any corner.
      #Second move takes center if availabe if not take any corner
      #Blocking: iterate through win combination array.
      #If any two tokens of the same kind take two/three comb spots, and is not my token, take third spot.
      #Winning, iterate through win comb array
      #If any two of my tokens in win combination, place my token on third spot.

      # WIN_COMBINATIONS = [
      #   [0,1,2],
      #   [3,4,5],
      #   [6,7,8],
      #   [0,3,6],
      #   [1,4,7],
      #   [2,5,8],
      #   [2,4,6],
      #   [0,4,8]
      # ]

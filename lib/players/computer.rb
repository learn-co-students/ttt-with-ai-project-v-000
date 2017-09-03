require 'pry'
module Players
  class Computer < Player

    def move(board)

      player = current_player
      current_move = current.move(@board)
      if @board.valid_move?(current_move)
        update(current_move, player)
      elsif ....
      end
    end



  end
end






      # A first move takes center
      # B takes upper left corner
      # A takes bottom left corner
      # B takes upper right corner
      # A takes middle top
      # B takes bottom middle
      # A takes middle left
      # B takes middle right
      # A takes bottom right



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



    end

  end
end

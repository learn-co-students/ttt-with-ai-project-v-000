##
# => Player module for cleanliness purposes
##
module Players
  ##
  # => Computer player creates a new computer player
  ##
  class Computer < Player
    ##
    # => Makes a random valid move
    ##
    def move(board)
      move = rand(1..9).to_s
      if board.valid_move?(move)
        return move
      else
        move(board)
      end
    end
  end
end

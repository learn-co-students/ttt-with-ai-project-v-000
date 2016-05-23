require_relative '../board.rb'
require_relative '../game.rb'

class Player::Computer < Player

############ Minimax algorithm implementation #####################

# the algorithm looks at the board to see what spaces are open
# it fills each space it can, assigning a score each time
# it looks at all the game states it generated and the picks the max one

  def move(game)
    "1" 
  end 

  def score(game)
    if game.won?
      if game.winner == self 
        return 10 
      else 
        return -10 
      end 
    else
      return 0 
    end 
  end 

  def possible_moves(game)
    possible_moves=[]
    game.board.cells.each_with_index do |cell, index|
      if !game.board.taken?((index + 1).to_s)
        possible_moves << (index + 1).to_s 
      end 
    end  
      possible_moves
  end

  def minimax(game)
    if game.over? 
      return score(game)
    else
      
    end
  end 

######## ###########################################################

end

require_relative '../board.rb'
require_relative '../game.rb'

class Player::Computer < Player

############ Minimax algorithm implementation #####################

# the algorithm looks at the board to see what spaces are open
# it fills each space it can, assigning a score each time
# it looks at all the game states it generated and the picks the max one

  def move(game)
    if game.current_player == self && game.board.turn_count == 0 
      "1"
    elsif game.current_player == self && game.board.turn_count == 1
      game.board.valid_move?("1") ? "1" : "3"
    else 
      # TODO call minimax 
    end 
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

require_relative '../board.rb'
require_relative '../game.rb'

class Player::Computer < Player

############ Minimax algorithm implementation #####################

  def move(game)
    if game.current_player == self && game.board.turn_count == 0
      "7"
    else 
      minimax(game)
      @best_move 
    end 
  end 

  def score(game)
    if game.won?
      if game.winner == self 
        return 10 - game.board.turn_count 
      else 
        return game.board.turn_count - 10 
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
      scores_array = self.possible_moves(game).collect do |input| 
        hypothetical_game = Game.clone(game)
        display = false 
        hypothetical_game.update(input, display)
        self.minimax(hypothetical_game)
      end
      if game.current_player == self 
        best_move_index = scores_array.index(scores_array.max)
        @best_move = possible_moves(game)[best_move_index]
        return scores_array.max
      else
        return scores_array.min
      end  
    end
  end 

######## ###########################################################

end

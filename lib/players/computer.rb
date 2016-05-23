require_relative '../board.rb'
require_relative '../game.rb'

class Player::Computer < Player

############ Minimax algorithm implementation #####################

  def move(game)
    if game.current_player == self && game.board.turn_count == 0 
      "1"
    elsif game.current_player == self && game.board.turn_count == 1
      game.board.valid_move?("1") ? "1" : "3"
    else 
      minimax(game)
      @best_move 
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
      scores_array = self.possible_moves(game).collect do |input| 
        hypothetical_game = Game.clone(game)
        hypothetical_game.update(input)
        self.minimax(hypothetical_game)
      end
      if game.current_player == self 
        best_move_index = scores_array.index(scores_array.maximum)
        @best_move = possible_moves[best_move_index]
        scores_array.maximum 
      else
        scores_array.minimum
      end  
    end
  end 

######## ###########################################################

end

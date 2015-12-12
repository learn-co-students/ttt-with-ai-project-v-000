require_relative '../player.rb'
require 'pry'
class Computer < Player

  attr_reader :best_move
def move(board)

  minimax(board, self)
  best_move
  #board.cells.each_with_index do |cell, index|
    #if cell == " "
      #return (index + 1).to_s
    #end
  #end

end 


def score(game)
  if game.won? && game.winner == self.token
    return 10 - depth
  elsif game.won? && game.winner != self.token
    return depth - 10 
  else 
    return 0
  end
end



def switch(token)
  token == "X" ? "O" : "X"
end


def minimax(board, current_player)
  
   return score(game) if over?

   scores = {}
   self.depth += 1
   binding.pry
    board.available_moves.each do |move|
     potential_board = board.dup
     
     potential_board.update(move, self)

     scores[move] = minimax(potential_board, current_player)

   end
     @best_move, best_score = best_score(current_player, scores)
     best_score
 end


def game_over 

end


def best_score(token, scores)
  if token = @token
    scores.max_by {|_k, v| v}
  else
    scores.min_by {|_k, v| v}
  end
end


end #ends Computer
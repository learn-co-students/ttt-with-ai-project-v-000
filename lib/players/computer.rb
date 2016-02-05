class Player::Computer < Player

  def opponent_token 
      self.token == "X" ? "O" : "X"
   end
 
   def move(board)
     return "5" if !board.taken?(5)
     best_option(board)
   end
 
   def best_option(board)
     win_move(board) || block_move(board) || strategic_move(board)
   end
 
   def win_state(board, token)
     Game::WIN_COMBINATIONS.detect do |combo|
       (board.cells[combo[0]] == token && board.cells[combo[1]] == token && !board.taken?(combo[2]+1)) || 
       (board.cells[combo[0]] == token && board.cells[combo[2]] == token && !board.taken?(combo[1]+1)) || 
       (board.cells[combo[1]] == token && board.cells[combo[2]] == token && !board.taken?(combo[0]+1))
     end
   end
 
   def win_move(board)
     if win_state(board, self.token)
       win_state(board, self.token).find{ |pos| board.cells[pos] == " " }.to_i+1
     end
   end
 
   def block_move(board)
     if win_state(board, opponent_token)
       win_state(board, opponent_token).find{ |pos| board.cells[pos] == " " }.to_i+1
     end
   end
 
   def strategic_move(board)
     [1,3,7,9,2,4,6,8].detect{ |pos| !board.taken?(pos) }
   end


end

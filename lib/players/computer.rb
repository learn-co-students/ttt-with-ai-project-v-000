module Players

  class Computer < Player
    def move(board)
     if !board.taken?("5")
       "5"
     else
       best_move(board) + 1
     end
   end

   def best_move(board)
     win(board) || block(board) || corner(board) || any
   end

   def corner(board)
     [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
   end

   def complete_combo?(board, token)
     Game::WIN_COMBINATIONS.detect do |combo|
       (
         (board.cells[combo[0]] == token && board.cells[combo[1]] == token) &&
         !board.taken?(combo[2]+1)
       ) ||
       (
         (board.cells[combo[1]] == token && board.cells[combo[2]] == token) &&
         !board.taken?(combo[0]+1)
       ) ||
       (
         (board.cells[combo[0]] == token && board.cells[combo[2]] == token) &&
         !board.taken?(combo[1]+1)
       )
     end
   end

   def win(board)
     win_combo = complete_combo?(board, self.token)
     if win_combo && win_combo.count{|index| board.position(index+1) == self.token} == 2
       puts "...found winning combo #{win_combo}"
       win_combo.detect{|index| !board.taken?(index+1)}
     end
   end

   def block(board)
     block_combo = complete_combo?(board, self.opponent)
     if block_combo && block_combo.count{|index| board.position(index+1) == self.opponent} == 2
       puts "...found blocking combo #{block_combo}"
       block_combo.detect{|index| !board.taken?(index+1)}
     end
   end

   def opponent
     self.token == "X" ? "O" : "X"
   end

   def any
     (0..8).to_a.sample
   end
  end
end

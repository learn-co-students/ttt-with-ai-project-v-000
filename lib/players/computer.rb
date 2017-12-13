require 'pry'
module Players
  class Computer < Player

    def move(board)
      if !board.taken?('5')
         '5'
     else
         best_option(board) + 1
       end
     end

def best_option(board)
# Center -win- block -  Corners - Random
 win(board) ||block(board)  || corner(board) ||  random
end #of best_option



def corner(board)
 [0, 2, 6, 8].detect { |x| !board.taken?(x+1) }
end #of corner

def random
  board = (0..8).to_a.sample
end #of random


    def win(board)
       win_combo = combo?(board, self.token)
       if win_combo && win_combo.count{|index| board.position(index+1) == self.token} == 2
         win_combo.detect{|index| !board.taken?(index+1)}
       end
     end

     def block(board)
            block_combo = combo?(board, self.opponent_token)
            if block_combo && block_combo.count{|index| board.position(index+1) == self.opponent_token} == 2
              block_combo.detect{|index| !board.taken?(index+1)}
            end
          end

    def opponent_token
      self.token == "X" ? "O" : "X"
    end

    def combo?(board, token)
       Game::WIN_COMBINATIONS.detect do |array|
         (
         (board.cells[array[0]] == token && board.cells[array[1]] == token) &&
           !board.taken?(array[2]+1)
         ) ||
         (
           (board.cells[array[1]] == token && board.cells[array[2]] == token) &&
           !board.taken?(array[0]+1)
        ) ||
         (
           (board.cells[array[0]] == token && board.cells[array[2]] == token) &&
           !board.taken?(array[1]+1)
         )
end #end of iteration
end #end of class Computer < Player

end #end of Module Players
end#end of win(board)

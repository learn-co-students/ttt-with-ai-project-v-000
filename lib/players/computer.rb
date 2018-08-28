require 'pry'
module Players
  class Computer < Player
    def find_win(board)
       @input = nil
       Game::WIN_COMBINATIONS.each do |w|
       if board.cells[w[0]] == board.cells[w[1]] && board.cells[w[0]] != " " && board.valid_move?("#{w[2] + 1}")
            @input = "#{w[2] + 1}"
       elsif board.cells[w[0]] == board.cells[w[2]] && board.cells[w[0]] != " " && board.valid_move?("#{w[1] + 1}")
            @input = "#{w[1] + 1}"
       elsif board.cells[w[1]] == board.cells[w[2]] && board.cells[w[1]] != " " && board.valid_move?("#{w[0] + 1}")
             @input = "#{w[0] + 1}"
       end
     end
     @input
   end
   def moves(board)
      moves = ["5", "1", "3", "7", "9", "2", "4", "6", "8"]
      moves.find{|p| board.valid_move?(p)}
   end
     def move(board)
          moves(board)
     end
   end
 end

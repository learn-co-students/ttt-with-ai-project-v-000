require 'pry'
module Players
  class Computer < Player

    def move(board)
      # We initialize the score_list
      scores = []
      # We identify the best move to make by assigning it a score. If the computer's next move gives him a win, he get 1 points
      #If it gives it a loss, he gets -1 point and if nothing, 0
      possible_moves = available_moves(board)
      scores = possible_moves.collect do |user_input|
        score = 0
        best_possible_move(board,user_input,self.token,score)
      end
    end


    def best_possible_move(board, move, token, score)

        #We copy the board we are received to not modify the original objects
        board_copy= Marshal.load(Marshal.dump(board))
        #binding.pry
        #We execute the move
        board_copy.cells[move] = token
        #We assess if the move executed give the computer a winning combination
        if board_copy.winning_board? && board.game_winner? == self.token
          #case 1: it does and the computer gets one point
          score += 1
        elsif board_copy.winning_board? && board.game_winner? != self.token
          #case 2, it does not and the computer loses one point
          score -= 1
        elsif board_copy.game_over?
          #case 3, the game is over, draw or win, or loose. We return the score associated with the move tried
          score
        else
          #case 4, the game is not over and we iterate to the next move and we change the player
          token = token == "X" ? "O" : "X"

          list_of_moves = available_moves(board_copy)

          list_of_moves.each do |new_move|
            best_possible_move(board_copy, new_move, token, score)
          end
        end
      end


      #We define the list of available moves to iterarte over them and get a score out of it
      def available_moves(board)
        available_moves =[]
        board.cells.each_with_index do |cell, index|
          if cell ==" "
            available_moves.push(index)
          end
        end
        available_moves
      end
      #end class & module


    end
end

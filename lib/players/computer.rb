require 'pry'
module Players
 class Computer < Player

   def move(board)
     case board.turn_count
       #for any of the first three moves, take an empty corner
     when 0..2
       if board.cells[4] == " "
         "5"
       else
         #find the free cells
         free = board.cells.size.times.select { |i| board.cells[i] == " " }
         #find the free corners in the free cells Array
         free_corners = free.select { |e| e == 0 || e == 2 || e == 6 || e == 8 }
         #select a random free corner for the move
         free_corners.sample.+(1).to_s
       end
     when 3..8
       comp_move = ""
       #go through the win combinations
       Game::WIN_COMBINATIONS.find do |win|
         #find the computer players moves on the board
        my_moves = board.cells.size.times.select { |i| board.cells[i] == token }
        #find the opponent's moves on the board
        opp_moves = board.cells.size.times.select { |i| board.cells[i] != token && board.cells[i] != " " }
        #From the win combination, subtract the opponent's moves and my moves (the computer's moves)
        leftover = win - my_moves
        opp_wins = win - opp_moves

        if leftover.size == 1
          leftover = leftover - opp_moves
        end
        if opp_wins.size == 1
          opp_wins = opp_wins - my_moves
        end
        #There is an opportunity to win if the leftover Array contains 1 remaining item, the winning move.
        if leftover.size == 1
          comp_move = leftover.first.+(1).to_s
          #There is an opportunity to block if the opp_wins Array contains 1 remaining item, the blocking move.
        elsif opp_wins.size == 1
          comp_move = opp_wins.first.+(1).to_s
        else
          #if there is no opportinity to block or win, then comp_move is nil for the block
          comp_move = nil
        end
      end
      if comp_move == nil
        [1, 3, 7, 9, 2, 4, 6, 8].detect { |i| !board.taken?(i) }.to_s
      else
        comp_move
      end
     end
   end
 end
end

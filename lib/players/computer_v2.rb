# require_relative '../player.rb'

# module Players
#   class Computer < Player
#     def move(board, game = Game.new)
#       (1..9).to_a.sample.to_s

#       #the job of this method is to return a valid move

#       # a valid move in this game is a string that represents a number
#       # from 1-9 which is not already taken

#       # def move(board)
#       #   # Player 1 logic
#       #   if self.token == "X"
#       #     player_move = "5" if board.turn_count == 0
#       #     if board.turn_count == 2
#       #       if corner_taken(board) != nil
#       #         player_move = corner_taken(board)
#       #       else
              
#       #       end
#       #     end
#       #   end
#       #   player_move
#       # end

#       # Helper Method
#       # def corner_taken(board)
#       #   if board.cells[1] == "O"
#       #     return 9
#       #   elsif board.cells[3] == "O"
#       #     return 7
#       #   elsif board.cells[7] == "O"
#       #     return 3
#       #   elsif board.cells[9] == "O"
#       #     return 1
#       #   end
#       # end

#       # PSEUDOCODE
#       #   *before every move: check to block a win and check for possible win

#       # Player 1 (X)
#       #   First move: center (5)
#       #   Second move: if edge move, take one of two opposite corners from edge
#       #   Third move: take the corner that leaves two possible wins
#       #   Second move: if corner move, take opposite corner
#       #   Third move: take the corner that leaves two possible wins or the edge that leads to a draw
#       #   Fourth move: Take win or draw
      
#       # Player 2 (O)
#       #   First move: center (5)
#       #   Second move: take a corner
#       #   First move: corner (1, 3, 7, 9)
#       #   Second move: take the center
#       #   Third move: take an edge

#       # Block a win
#       #   Get current board
#       #   Iterate through win combinations for opposite token and fill potential win slot

#       # Secure a win
#       #   Get current board
#       #   Iterate through win combinations for your token and fill potential win slot



#     end
#   end
# end
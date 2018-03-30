class Players
  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [6,4,2]]

    def move(board)
      self.token == "X" ? opp_token == "O" : opp_token == "X"
      # FIRST PLAYER
      # Move 1: Top left corner
      board.turn_count == 0 ? board.cells[0] = self.token
      # Move 2: Center if free, else bottom right corner
      board.turn_count == 2 && board.cells[4] == " " ? board.cells[4] = self.token : board.cells[8] = self.token
      # Move 3:
      # If opponent in center, block win
      WIN_COMBINATIONS.each |combo|
        if combo.count(opp_token) == 2
          combo[0] = self.token if combo[0] == " "
          combo[1] = self.token if combo[1] == " "
          combo[2] = self.token if combo[2] == " "
      # If opponent does nto




#      WIN_COMBINATIONS.each do |combo|
#        # Sees if two cells of winning combination matches player token and third is empty
#        if board.cells[combo[0]] == self.token && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
#          best_move = combo[2]
#        elsif
#          board.cells[combo[0]] == self.token && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
#          best_move = combo[1]
#        elsif
#          board.cells[combo[1]] == self.token && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
#          best_move = combo[0]
#        # Sees if opponent has two of three spots in winning combination and blocks.
#        elsif board.cells[combo[0]] != self.token && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
#          best_move = combo[2]
#        elsif
#          board.cells[combo[0]] != self.token && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
#          best_move = combo[1]
#        elsif
#          board.cells[combo[1]] != self.token && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
#          best_move = combo[0]
#        else
          best_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
#        end
#      end
      best_move
    end

  end
end

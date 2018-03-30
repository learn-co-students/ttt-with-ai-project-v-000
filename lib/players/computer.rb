class Players
  class Computer < Player
    
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [6,4,2]]

    def move(board)
      best_move = 10
      self.token == "X" ? opp_token == "O" : opp_token == "X"
      # FIRST PLAYER
      # Move 1: Top left corner
      best_move = 0 if board.turn_count == 0
      # Move 3: Center if free, else bottom right corner
      board.turn_count == 2 && board.cells[4] == " " ? best_move = 4 : best_move = 8
      # Move 5:
      if board.turn_count == 4
        # If opponent in center, block win
        if board.cells[4] == opp_token
          block_win
        # If player in center and opponent does not block win in lower right corner, WIN
        else
          WIN_COMBINATIONS.each |combo|
            if combo.count(self.token) == 2
              best_move = 8 if combo[8] == " "
        # If opponent blocking win and opponent can win, block win
            elsif combo.count(opp_token) == 2
              block_win
        # If opponent blocking win and can't win, setup two way win
            else
              best_move = 2
            end
          end
        end
      end
      #Move 7:
      win if board.turn_count == 6
    end

    def win
      WIN_COMBINATIONS.each do |combo|
        if combo.count(self_token) == 2
          best_move = 0 if combo[0] == " "
          best_move = 1 if combo[1] == " "
          best_move = 2 if combo[2] == " "
        end
      end
    end

    def block_win
      WIN_COMBINATIONS.each do |combo|
        if combo.count(opp_token) == 2
          best_move = 0 if combo[0] == " "
          best_move = 1 if combo[1] == " "
          best_move = 2 if combo[2] == " "
        end
      end
    end
    
  end
end
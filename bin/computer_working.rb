class Players
  class Computer < Player
    attr_accessor :opp_token, :best_move

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [2,5,8], [1,4,7], [0,4,8], [6,4,2]]

    def move(board)
      @best_move = 10
      current_board = board.cells
      self.token == "X" ? @opp_token = "O" : @opp_token = "X"
      # FIRST PLAYER
      # Move 1: Top left corner
      @best_move = 1 if board.turn_count == 0
      # Move 3: Center if free, else bottom right corner
      if board.turn_count == 2
        if current_board[4] == " "
          @best_move = 5
        else
          @best_move = 9
        end
      # Move 5:
      elsif board.turn_count == 4
        # If opponent in center, block win
        if current_board[4] == opp_token
          block_win(current_board)
        # If player in center and opponent does not block win in lower right corner, WIN
        else
          WIN_COMBINATIONS.each do |combo|
            if [current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].count(self.token) == 2
              @best_move = 9 if current_board[8] == " "
        # If opponent is blocking win and opponent can win, block win
            elsif [current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].count(opp_token) == 2
              block_win(current_board)
            end
        # If opponent blocking win and can't win, setup two way win
          end
          @best_move = 3 if best_move == 10
        end
      end
      #Move 7:
      win(current_board) if board.turn_count == 6
      #Best move or random
      if best_move < 10
        best_move
#      else
#        [1,2,3,4,5,6,7,8,9].sample
      end
    end


    def win(current_board)
      WIN_COMBINATIONS.each do |combo|
        if [current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].count(self.token) == 2
          @best_move = combo[0]+1 if current_board[combo[0]] == " "
          @best_move = combo[1]+1 if current_board[combo[1]] == " "
          @best_move = combo[2]+1 if current_board[combo[2]] == " "
        end
      end
    end

    def block_win(current_board)
      WIN_COMBINATIONS.each do |combo|
        if [current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].count(opp_token) == 2
          @best_move = combo[0]+1 if current_board[combo[0]] == " "
          @best_move = combo[1]+1 if current_board[combo[1]] == " "
          @best_move = combo[2]+1 if current_board[combo[2]] == " "
        end
      end
    end

  end
end

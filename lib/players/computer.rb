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
        # If occupy center and opponent does not block win in lower right corner, WIN
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
      #Move 6-9:
      if board.turn_count >= 5
        win(current_board)
        block_win(current_board) if best_move == 10
        [1,2,3,4,5,6,7,8,9].sample
      end

      #SECOND Player
      # Move 2: Center or Top Left Corner
      if board.turn_count == 1
        if current_board[4] == " "
          @best_move = 5
        else
          @best_move = 1
        end
      end
      # Move 4

      if board.turn_count == 3
        block_win(current_board)
        if best_move == 10
          # If opponent occupies two center edges and can win two ways by playing the corner
          if win_position(current_board)
            win_position(current_board)
          # If opponent controls the center or not
          else
            current_board[4] == opp_token ? own_the_diagonal_row(current_board) : own_the_middle_row(current_board)
          end
        end
      end

      #Best move
      if best_move < 10
        best_move
      else
        [1,2,3,4,5,6,7,8,9].sample if best_move == 10
      end
    end

    def win(current_board)
      winning_moves = []
      WIN_COMBINATIONS.each do |combo|
        if [current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].count(self.token) == 2
          @best_move = combo[0]+1 if current_board[combo[0]] == " "
          @best_move = combo[1]+1 if current_board[combo[1]] == " "
          @best_move = combo[2]+1 if current_board[combo[2]] == " "
        end
      end
    end

    def win_position(current_board)
      winning_moves = []
      WIN_COMBINATIONS.each do |combo|
        if current_board[combo[1]] == opp_token
          if [current_board[combo[0]], current_board[combo[2]]].count(" ") == 2
            winning_moves << combo[0]+1
            winning_moves << combo[2]+1
          end
        end
      end
      @best_move = winning_moves.uniq.max_by{|i| winning_moves.count(i)}
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

    def own_the_diagonal_row(current_board)
      WIN_COMBINATIONS.each do |combo|
        if ![current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].include?(opp_token)
          @best_move = combo[0]+1 if current_board[combo[0]] == " " && combo[0].even?
          @best_move = combo[1]+1 if current_board[combo[1]] == " " && combo[1].even?
          @best_move = combo[2]+1 if current_board[combo[2]] == " " && combo[2].even?
        end
      end
    end

    def own_the_middle_row(current_board)
      WIN_COMBINATIONS.each do |combo|
        if ![current_board[combo[0]], current_board[combo[1]], current_board[combo[2]]].include?(opp_token)
          @best_move = combo[0]+1 if current_board[combo[0]] == " " && combo[0].odd?
          @best_move = combo[1]+1 if current_board[combo[1]] == " " && combo[1].odd?
          @best_move = combo[2]+1 if current_board[combo[2]] == " " && combo[2].odd?
        end
      end
    end

  end
end

class Player::Computer < Player
  BEST_LOCATION = [5,1,3,7,9,2,4,6,8]

  def about_to_win(token, board)
    counter = 0
    win_combo = "n"
    position = 9
    while counter < 8 and win_combo == "n" do
      winning_combo = Game::WIN_COMBINATIONS[counter]
      space_count = 0
      token_count = 0
      free_space = 0
      winning_combo.each_index do |i|
        if board.cells[winning_combo[i]] == token
          token_count += 1
        else
          if board.cells[winning_combo[i]] == " "
            space_count += 1
            free_space = winning_combo[i]
          end
        end
      end
      if token_count == 2 and space_count == 1
        #next move is winner
        win_combo = 'y'
        position = free_space + 1
      end
      counter += 1
    end
    position
  end

  def best_position(board)
    counter = 0
    best = "n"
    while counter < 9 and best == "n" do
      if !board.taken?(BEST_LOCATION[counter])
        best = "y"
      else
        counter += 1
      end
    end
    BEST_LOCATION[counter]
  end

  def move(board)
    position = about_to_win(self.token, board)
    if position == 9
      #no winning move
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end
      position = about_to_win(opponent_token, board)
      if position == 9
        #no winning move for opponent
        position = best_position(board)
      end
    end
    char = position.to_s
  end

end

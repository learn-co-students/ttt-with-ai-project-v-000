# def move(board)
#   (1..9).to_a.sample.to_s
# end

# check for move validity in this class to add additional computer intelligence
# possibly initialize game in player class as well
# include game as a move argument so you know which token you are
# build moves if X or if O

@@corner_move = [1, 3, 7, 9].sample.to_s
@@edge_move = [2, 4, 6, 8].sample.to_s
@@random_move = (1..9).to_a.sample.to_s

def move(board)
  if board.turn_count == 0 || board.turn_count == 1
    first_move(board)
  elsif board.turn_count == 2 || board.turn_count == 3
    if board.valid_move?(block_win(board))
      block_win(board)
    elsif board.valid_move?(secure_win(board))
      secure_win(board)
    else
      second_move(board)
    end
  elsif board.turn_count == 4
    if board.valid_move?(block_win(board))
      block_win(board)
    elsif board.valid_move?(secure_win(board))
      secure_win(board)
    else
      third_move(board)
    end
  else
    if board.valid_move?(block_win(board))
      block_win(board)
    elsif board.valid_move?(secure_win(board))
      secure_win(board)
    else
      @@random_move
    end
  end
end

# return nil if there's no valid move
# method to block other player's possible win
def block_win(board)
  Game::WIN_COMBINATIONS.find do |combo|
    poss_win = []
    combo.each { |i| poss_win << board.cells[i] }
    if poss_win.count("O") == 2 && poss_win.count(" ") == 1 && self.token == "X"
      player_move = poss_win.find_index(" ") + 1
    elsif poss_win.count("X") == 2 && poss_win.count(" ") == 1 && self.token == "O"
      player_move = poss_win.find_index(" ") + 1
    end
    player_move
  end
end

# return nil if there's no valid move
# method to execute game-winning move
def secure_win(board)
  Game::WIN_COMBINATIONS.find do |combo|
    poss_win = []
    combo.each { |i| poss_win << board.cells[i] }
    if poss_win.count("X") == 2 && poss_win.count(" ") == 1 && self.token == "X"
      player_move = poss_win.find_index(" ") + 1
    elsif poss_win.count("O") == 2 && poss_win.count(" ") == 1 && self.token == "O"
      player_move = poss_win.find_index(" ") + 1
    end
    player_move
  end
end

# move methods by turn
def first_move(board)
  if self.token == "X"
    player_move = "5"
  elsif self.token == "O"
    board.cells[4] == "X" ? player_move = "1" : player_move = "5"
  end
  player_move
end

def second_move(board)
  if self.token == "X"
    if board.cells[1] == "O"
      player_move = "7"
    elsif board.cells[2] == "O"
      player_move = "4"
    elsif board.cells[3] == "O" || board.cells[8] == "O"
      player_move = "3"
    elsif board.cells[5] == "O" || board.cells[7] == "O"
      player_move = "5"
    elsif board.cells[6] == "O"
      player_move = "2"
    end
    player_move
  elsif self.token == "O"
    if board.cells[4] == "O" || [2, 4, 6, 8].find { |i| board.cells[i] == "O" }
      player_move = @@corner_move
    elsif [1, 3, 7, 9].find { |i| board.cells[i] == "O" }
      player_move = @@edge_move
    end
    player_move
  end
end

def third_move(board)
  if [1, 2, 3, 6].find { |i| board.cells[i] == "X" }
    player_move = "5"
  elsif board.cells[4] == "X" && board.cells[5] == "O"
    player_move = "3"
  elsif board.cells[4] == "X" && board.cells[7] == "O"
    player_move = "7"
  end
  player_move
end
class Player::Computer < Player

  def move(board)
    puts "It is computer player #{token} turn"
    win(board) || defend(board) || center(board) || corner(board) || random(board)
  end

  def random(board)
    computed_input = (rand(9) + 1).to_s until board.valid_move?(computed_input)
    computed_input
  end

  def win(board)
    winning_combo = winning_move(board)
    winning_combo.find { |i| !board.taken?(i+1) } + 1 if winning_combo
  end

  def center(board)
    "5" unless board.taken?(5)
  end

  def corner(board)
    corners = ["1", "3", "7", "9"]
    if corners.map { |corner_value| board.taken?(corner_value) }.include?(false)
      play = corners.sample
      play = corners.sample while board.taken?(play)
      play
    else
      false
    end
  end

  def defend(board)
    winning_combo = winning_move(board, token == "X" ? "O" : "X")
    winning_combo.find { |i| !board.taken?(i+1) } + 1 if winning_combo
  end

  def winning_move(board, winner_token = token)
    Game::WIN_COMBINATIONS.find do |win_combo|
      (board.cells[win_combo[0]] == winner_token && board.cells[win_combo[1]] == winner_token && !board.taken?(win_combo[2]+1)) ||
      (board.cells[win_combo[1]] == winner_token && board.cells[win_combo[2]] == winner_token && !board.taken?(win_combo[0]+1)) ||
      (board.cells[win_combo[0]] == winner_token && board.cells[win_combo[2]] == winner_token && !board.taken?(win_combo[1]+1))
    end
  end

end

class Player::Computer < Player

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def move(board)
    minimax = Array.new
    moves = (1..9).to_a.shuffle

    # moves.each_with_index do |i, index|
    moves.each do |i|
      if board.valid_move?(i)
        # board.cells[index] = opposite_token

        if self.token == "X"
          if won?(board)
            minimax << {move: i, score: 1}
            # board.cells[index] = " "
          elsif draw?(board)
            minimax << {move: i, score: 0}
            # board.cells[index] = " "
          else
            minimax << {move: i, score: -1}
            # board.cells[index] = " "
          end
        else
          if won?(board)
            minimax << {move: i, score: -1}
            # board.cells[index] = " "
          elsif draw?(board)
            minimax << {move: i, score: 0}
            # board.cells[index] = " "
          else
            minimax << {move: i, score: 1}
            # board.cells[index] = " "
          end
        end
      end
    end
    minimax.max { |a, b| a[:score] <=> b[:score] }[:move].to_s
  end

  def opposite_token
    if self.token == "X"
      "O"
    else
      "X"
    end
  end

  def draw?(board)
    if !won?(board) && board.full?
      true
    elsif won?(board)
      false
    elsif !board.full? && won?(board)
      false
    end
  end

  def won?(board)
    player_1_won = false
    player_2_won = false
    WIN_COMBINATIONS.each do |win_combo|
      if board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X"
        player_1_won = "X"
      elsif board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O"
        player_2_won = "O"
      else
        false
      end
    end
    player_1_won || player_2_won
  end
end

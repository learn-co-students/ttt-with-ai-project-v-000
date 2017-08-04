module Players

  class Computer < Player

    def move(board)
      @token == "O" ? opponent_token = "X" : opponent_token = "O"

      if board.valid_move?("5")
        move_idx = 4
      elsif next_move(board, @token, 2) != nil
        move_idx = next_move(board, @token, 2)
      elsif next_move(board, opponent_token, 2) != nil
        move_idx = next_move(board, opponent_token, 2)
      elsif next_move(board, @token, 1, true) != nil
        move_idx = next_move(board, @token, 1, true)
      elsif next_move(board, @token, 1) != nil
        move_idx = next_move(board, @token, 1)
      elsif next_move(board, @token, 0) != nil
        move_idx = (0..8).detect {|spot| spot.even? && board.valid_move?("#{spot + 1}")}
      else
        move_idx = (0..8).detect {|spot| board.valid_move?("#{spot + 1}")}
      end
      "#{move_idx + 1}"
    end

    def next_move(board, check_token, check_token_count, check_corner = false)
      winner = nil
      Game::WIN_COMBINATIONS.detect do |combo|
        xoxocombo = combo.map {|i| board.cells[i]}
        count = xoxocombo.count{|cell| cell == check_token}
        if count == check_token_count && count_valid_moves(board, combo) == combo.size - count
          winner = combo.detect do |index|
            board.valid_move?("#{index + 1}") && (check_corner == true ? index.even? : true)
          end
        end
      end
      winner
    end

    def count_valid_moves(board, combo)
      combo.count {|cell| board.valid_move?("#{cell + 1}")}
    end

  end
end

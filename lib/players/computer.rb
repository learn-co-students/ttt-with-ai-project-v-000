module Players
  class Computer < Player

    CORNER_PAIRS = [
      [0, 2],
      [2, 8],
      [8, 6],
      [6, 0]
    ]

    def move(board)
      puts "\n#{token}'s move:\n"
      if (first_move(board) != nil) && ((board.turn_count == 0) || (board.turn_count == 1))
        first_move(board)
=begin
  To enable Easy Mode (with beatable AI and therefore a possibility of CPU winning in Wargames) comment out both elsif conditionals that follow below.
=end
      elsif block_or_win(board) == nil && corner_move(board) != nil
        corner_move(board)
      elsif block_or_win(board) != nil
        block_or_win(board)
#end commenting here for Easy Mode
      else
        (1..9).to_a.reject{|i| !board.valid_move?(i)}.sample.to_s
      end
    end

    def first_move(board)
      corners = ["1", "3", "7", "9"]
      board.valid_move?("5") ? "5" : corners.sample
    end

    def corner_move(board)
      move = nil
      CORNER_PAIRS.detect do |pair|
        if board.cells[pair[0]] != " " && board.cells[pair[1]] == " "
          move = (pair[1] + 1).to_s
        elsif board.cells[pair[1]] != " " && board.cells[pair[0]] == " "
          move = (pair[0] + 1).to_s
        end
      end
      move
    end

    def block_or_win(board)
      move = nil
      Game::WIN_COMBINATIONS.detect do |combo|
        if board.cells[combo[0]] != " " && board.cells[combo[1]] != " " && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[2]] == " "
          move = (combo[2] + 1).to_s
        elsif board.cells[combo[1]] != " " && board.cells[combo[2]] != " " && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
          move = (combo[0] + 1).to_s
        elsif board.cells[combo[0]] != " " && board.cells[combo[2]] != " " && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
          move = (combo[1] + 1).to_s
        end
      end
      move
    end

  end
end

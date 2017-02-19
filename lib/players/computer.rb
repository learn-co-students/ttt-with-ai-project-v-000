module Players
  class Computer < Player

    CORNERS = ["1","3","7","9"]

    def move(board)
      case (board.turn_count)
      when 0
        "3"
      when 1
        CORNERS.detect {|cell|
          board.valid_move?(cell)}
      when 2
        if !board.valid_move?("5")
          "7"
        elsif !board.valid_move?("1")
          "9"
        elsif !board.valid_move?("6")
          "1"
        end
      else
        win_combo = Game::WIN_COMBINATIONS.detect {|combo|
          (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.valid_move?((combo[2]+1).to_s)) ||
          (board.cells[combo[0]] == token && board.valid_move?((combo[1]+1).to_s) && board.cells[combo[2]] == token) ||
          (board.valid_move?((combo[0]+1).to_s) && board.cells[combo[1]] == token && board.cells[combo[2]] == token)
        }
        win_combo.detect {|cell| board.valid_move?((cell+1).to_s)}
      end

  	end
  end
end

module Players
  class Computer < Player

    def move(board)
      move = nil
      if board.valid_move?(5)
        "5"
      elsif almost_win(board)
        if board.valid_move?(almost_win(board)[0]+1)
          (almost_win(board)[0]+1).to_s
        elsif board.valid_move?(almost_win(board)[1]+1)
          (almost_win(board)[1]+1).to_s
        elsif board.valid_move?(almost_win(board)[2]+1)
          (almost_win(board)[2]+1).to_s
        else
          random(board)
        end
      else
        random(board)
      end
    end

    def almost_win(board)
      Game::WIN_COMBINATIONS.find do |combo|
        (board.cells[combo[0]] == board.cells[combo[1]] && !board.taken?(combo[2]+1) && board.taken?(combo[0]+1) && board.taken?(combo[1]+1)) ||
        (board.cells[combo[0]] == board.cells[combo[2]] && !board.taken?(combo[1]+1) && board.taken?(combo[0]+1) && board.taken?(combo[2]+1)) ||
        (board.cells[combo[1]] == board.cells[combo[2]] && !board.taken?(combo[0]+1) && board.taken?(combo[1]+1) && board.taken?(combo[2]+1))
      end
    end

    def random(board)
      ["1", "2", "3", "4", "6", "7", "8", "9"].sample
    end
  end
end

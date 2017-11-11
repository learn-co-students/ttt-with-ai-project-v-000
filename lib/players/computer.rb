class Players
  class Computer < Player

    def move(board)
      puts board.display
      puts "\nTicTacToeBot is making a move"
      move = defense(board)
      until board.valid_move?(move)
        if [1,3,7,9].any? {|position| !board.taken?(position)}
          move = [1,3,7,9].sample
        else [1,3,7,9].all? {|position| board.taken?(position)}
          if !board.taken?(5)
            move = 5
          else
            move = [2,4,6,8].sample
          end
        end
      end
      move.to_s
    end

    def defense(board)
      Game::WIN_COMBINATIONS.each do |winning_combo|
        if (board.cells[winning_combo[0]] == board.cells[winning_combo[1]] && board.taken?(winning_combo[0]+1)) ||
           (board.cells[winning_combo[1]] == board.cells[winning_combo[2]] && board.taken?(winning_combo[1]+1)) ||
           (board.cells[winning_combo[0]] == board.cells[winning_combo[2]] && board.taken?(winning_combo[2]+1))
           winning_combo.each do |position|
             return position unless board.taken?(position)
           end
        end
      end
      return 10
    end

  end
end

module Players
  class ComputerDumb < Player
    def move(_board) # picking the cell "square"
      puts "I am #{token}"
      rand(9) + 1
    end
  end

  class Computer < Player
    def opponents_token
      #  if token == "X"
      #     "O"
      #  else
      #     "X"
      #  end
      token == 'X' ? 'O' : 'X'
    end

    CELL_CHOICES = [4, 0, 2, 6, 8, 1, 5, 7, 3].freeze

    def move(board)
      Game::WIN_COMBINATIONS.each do |possible_win_indexes|
        possible_win_tokens = possible_win_indexes.collect do |index|
          board.cells[index]
        end
        # [3 ,   4,   5]
        # ['X', ' ', 'X']
        if possible_win_tokens.count(opponents_token) == 2
          i = possible_win_tokens.index(' ')
          return (possible_win_indexes[i] + 1).to_s if i
        end

        #
      end

      (CELL_CHOICES.detect { |index| board.cells[index] == ' ' } + 1).to_s
     end
  end
end



##this is hard

module Players
  class Computer < Player
    attr_reader :board
    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

    def move(board)
      @board = board

      opponent_token

      if check_for_winning_move != nil
        number = check_for_winning_move
      elsif block_opponent != nil
        number = block_opponent
      else
        number = free_move
      end
      number += 1
      return number.to_s #is returning the non-indexed number
    end

    def opponent_token
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end
    end

    def check_for_winning_move
      winning_move = nil
      WIN_COMBINATIONS.detect do |win_combo|
        position_1 = board.cells[win_combo[0]]
        position_2 = board.cells[win_combo[1]]
        position_3 = board.cells[win_combo[2]]

        if (position_1 == self.token && position_2 == self.token && position_3 == " ")
          winning_move = win_combo[2]
        elsif (position_1 == self.token && position_2 == " " && position_3 == self.token)
          winning_move = win_combo[1]
        elsif (position_1 == " " && position_2 == self.token && position_3 == self.token)
          winning_move = win_combo[0]
        end
      end
      winning_move
    end

    def block_opponent
      blocking_move = nil
      WIN_COMBINATIONS.detect do |win_combo|
        position_1 = board.cells[win_combo[0]]
        position_2 = board.cells[win_combo[1]]
        position_3 = board.cells[win_combo[2]]

        if (position_1 == opponent_token && position_2 == opponent_token && position_3 == " ")
          blocking_move = win_combo[2]
        elsif (position_1 == opponent_token && position_2 == " " && position_3 == opponent_token)
          blocking_move = win_combo[1]
        elsif (position_1 == " " && position_2 == opponent_token && position_3 == opponent_token)
          blocking_move = win_combo[0]
        end
      end
      blocking_move
    end

    def free_move
      corners = [0, 2, 6, 8]
      corner_move = corners.detect {|i| board.cells[i] == " "}
      if board.cells[4] == " "
        return 4
      elsif corner_move
        return corner_move
      else
        empty = []
        board.cells.each_with_index do |space, index|
          if space == " "
            empty << index
          end
        end
        return empty.sample
      end
    end
  end
end

# - AI Logic -
# 1. Check to see if the computer has a winning combo with two tokens and one empty space
# --> If yes: put the token in the empty space
# 2. Check to see if the opponent has a winning combo with two tokens and one empty space
# --> If yes: put the token in the empty space
# 3. Else, check if the middle space is open
# 4. Else, check if a corner space is open
# 5. Else, choose another space at random

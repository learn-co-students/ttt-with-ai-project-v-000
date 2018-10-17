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
  
      if winning_move_check != nil
        number = winning_move_check
      elsif block_opponent != nil
        number = block_opponent
      else
        number = other_move
      end
      number += 1
      return number.to_s
    end

    def opponent_token
      if self.token == "X"
        opponent_token = "O"
      else
        opponent_token = "X"
      end
    end

    def winning_move_check
      winning_move = nil
      WIN_COMBINATIONS.detect do |combo|
        pos_1 = board.cells[combo[0]]
        pos_2 = board.cells[combo[1]]
        pos_3 = board.cells[combo[2]]

        if (pos_1 == self.token && pos_2 == self.token && pos_3 == " ")
          winning_move = combo[2]
        elsif (pos_1 == self.token && pos_2 == " " && pos_3 == self.token)
          winning_move = combo[1]
        elsif (pos_1 == " " && pos_2 == self.token && pos_3 == self.token)
          winning_move = combo[0]
        end
      end
      winning_move
    end

    def block_opponent
      blocking_move = nil
      WIN_COMBINATIONS.detect do |combo|
        pos_1 = board.cells[combo[0]]
        pos_2 = board.cells[combo[1]]
        pos_3 = board.cells[combo[2]]

        if (pos_1 == opponent_token && pos_2 == opponent_token && pos_3 == " ")
          blocking_move = combo[2]
        elsif (pos_1 == opponent_token && pos_2 == " " && pos_3 == opponent_token)
          blocking_move = combo[1]
        elsif (pos_1 == " " && pos_2 == opponent_token && pos_3 == opponent_token)
          blocking_move = combo[0]
        end
      end
      blocking_move
    end

    def other_move
      corners = [0, 2, 6, 8]
      corner_move = corners.detect {|block| board.cells[block] == " "}
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

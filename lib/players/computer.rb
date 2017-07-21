module Players
  class Computer < Player
    FIRST_MOVE_OF_GAME = "5"

    def move(board)
      return FIRST_MOVE_OF_GAME if board.first_turn?

      find_my_winning_move(board) || find_opponents_winning_move(board) || find_any_available_move(board)
    end

    private

    def find_any_available_move(board)
      board.find_move_in_any_available_position
    end

    def find_my_winning_move(board)
      board.find_winning_move_for_token(self.token)
    end

    def find_opponents_winning_move(board)
      opponent_token = self.token == Board::TOKEN_CROSS ? Board::TOKEN_NOUGHT : Board::TOKEN_CROSS
      board.find_winning_move_for_token(opponent_token)
    end
  end
end

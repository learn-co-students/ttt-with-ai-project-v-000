module Players
  class Computer < Player

    attr_accessor :player, :opponent_token

    def initialize(player_token)
      super
      self.token == "X" ? self.opponent_token = "O" : self.opponent_token = "X"
      # binding.pry
        # self.board = game.board
    end

    def move(board)
      # binding.pry
      if position_priority(board) != nil
        # binding.pry
        priority = position_priority(board)
        move = priority.detect {|cell| board.cells[cell] == " "} + 1
        sleep 1
        move.to_s
      else
        move = board.available_moves.sample + 1
        sleep 1
        move.to_s
      end
    end

#     def check_priority
#       flag = true
# end
#
#
    def position_priority(board)

      Game::WIN_COMBINATIONS.find do |combo|
        # binding.pry
        (board.board_pos(combo[0]) == opponent_token && board.board_pos(combo[1]) == opponent_token && board.board_pos(combo[2]) == " ") ||
        (board.board_pos(combo[0]) == opponent_token && board.board_pos(combo[2]) == opponent_token && board.board_pos(combo[1]) == " ") ||
        (board.board_pos(combo[1]) == opponent_token && board.board_pos(combo[2]) == opponent_token && board.board_pos(combo[0]) == " ") ||
        (board.board_pos(combo[0]) == token && board.board_pos(combo[1]) == token && board.board_pos(combo[2]) == " ") ||
        (board.board_pos(combo[0]) == token && board.board_pos(combo[2]) == token && board.board_pos(combo[1]) == " ") ||
        (board.board_pos(combo[1]) == token && board.board_pos(combo[2]) == token && board.board_pos(combo[0]) == " ")
      end
    end
  end
end

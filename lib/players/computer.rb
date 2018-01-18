module Players
  class Computer < Player

    attr_accessor :player, :opponent_token

    def initialize(player_token)
      super
      self.token == "X" ? self.opponent_token = "O" : self.opponent_token = "X"
    end

    def move(board)
      if position_priority(board) != nil # If a combination is found where player or opponent has 2/3 winning moves, block win or take win.
        priority = position_priority(board)
        move = priority.detect {|cell| board.cells[cell] == " "} + 1
        sleep 1
        move.to_s
      else  # for early moves where no one has 2/3 winning combination. Not very smart.
        move = board.available_moves.sample + 1
        sleep 1
        move.to_s
      end
    end

# Determine if opponent has 2 of 3 spots in a winning combination, or if player has 2 of 3 spots in a winning combination, then return that winning combination.
    def position_priority(board)


      Game::WIN_COMBINATIONS.find do |combo|
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

require_relative "../player.rb"

module Players
  class Computer < Player
    def move(board)
      computer_move = (1..9).to_a.sample.to_s

      # strategic moves
      if self.token == "X"
        # first player strategic moves
      else
        # second player strategic moves
      end
    end
  end
end
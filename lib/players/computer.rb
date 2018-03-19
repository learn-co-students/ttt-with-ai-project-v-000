module Players
    class Computer < Player
        #  input = nil
      def move(board)
      input = rand(1..9).to_s
      # board.current_player = self
      # if board.valid_move?(input)
      #   board.update(input, player)
      # else
      #   move(board)
      #  end

    end
  end
end

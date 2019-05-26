module Players

    class Computer < Player
      def move(board)
        board.valid_moves.sample




      end


    end

end

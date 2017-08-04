module Games
  class Challenge < Game

      def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
      end

      def play #primarily for bin
        while !over?
          self.turn
          @board.display
          sleep(1)
        end

        case winner
        when "X"
          puts "Congratulations X!"
        when "O"
          puts "Congratulations O!"
        end

        if draw?
          puts "Cat's Game!"
        end
      end

  end
end

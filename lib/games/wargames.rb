require 'pry'
module Games
  class Wargames < Game
    @@draws = []
    @@x_wins = []
    @@o_wins = []

      def initialize(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
      end

      def play #primarily for bin
        while !over?
          self.turn
          @board.display
        end

        case winner
        when "X"
          @@x_wins << self
          puts "Congratulations X!"

        when "O"
          @@o_wins << self
          puts "Congratulations O!"

        end

        if draw?
          @@draws << self
          puts "Cat's Game!"
        end
      end

      def self.results
        puts "Draws: #{@@draws.length}"
        puts "X Wins: #{@@x_wins.length}"
        puts "O Wins: #{@@o_wins.length}"
      end

  end
end

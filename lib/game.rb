
require 'pry'
class Game
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    attr_accessor :player_1, :player_2, :board

    def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def over?
      won? || draw?
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            first_position = combo[0] + 1
            token1_matches_token2 = board.cells[combo[0]] == board.cells[combo[1]]
            token2_matches_token3 = board.cells[combo[1]] == board.cells[combo[2]]
            if board.taken?(first_position) && token1_matches_token2 && token2_matches_token3
                combo
            end
        end
    end

    def draw?
      @board.full? && !won?
    end

    def winner
      if combo = won?
        @winner = @board.cells[combo.first]
      end
    end

    def turn
      input = current_player.move(board)
      if @board.valid_move?(input)
        @board.update(input,current_player)
        @board.display
      else
        turn
      end
    end

    def play
      until over?
        turn
      end
      if won?
        current_player = winner
        puts "Congratulations #{current_player}!"
      elsif draw?
          puts "Cat's Game!"
      end
    end
end

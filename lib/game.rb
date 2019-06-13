require "pry"
class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.detect {|wincomb| board.cells[wincomb[0]] == board.cells[wincomb[1]] &&
        board.cells[wincomb[1]] == board.cells[wincomb[2]] && board.cells[wincomb[0]] != " "}
    end

    def draw?
        board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
        won? ? board.cells[won?[0]] : nil
    end

    def turn
        # binding.pry
        input = current_player.move(board)
        if board.valid_move?(input)
            board.update(input, current_player)
            board.display
        else
            turn
        end
    end

    def play
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end

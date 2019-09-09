require 'pry'
class Game
    attr_accessor :board, :player_1, :player_2

    WIN_COMBINATIONS = [
         [0,1,2],
         [3,4,5],
         [6,7,8],
         [0,3,6],
         [1,4,7],
         [2,5,8],
         [0,4,8],
         [2,4,6]
        ]

        def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
            @player_1 = player_1
            @player_2 = player_2
            @board = board
        end

        def current_player
            board.cells.count {|c| c != " "} %2 == 0 ? player_1 : player_2
        end

        def over?
            won? || draw?
        end

        def won?
            WIN_COMBINATIONS.any? do |combo|
                if 
                    board.cells[combo[0]] == player_1.token && 
                    board.cells[combo[1]] == player_1.token && 
                    board.cells[combo[2]] == player_1.token || 
                    board.cells[combo[0]] == player_2.token && 
                    board.cells[combo[1]] == player_2.token && 
                    board.cells[combo[2]] == player_2.token
                    return combo
                end
            end
        end 

        def draw?
            !won? && board.full?
        end

        def winner
            if won? then board.cells[won?[0]]
            end
        end

        def turn
              move = current_player.move(board)
              #binding.pry
              board.valid_move?(move) ? board.update(move, current_player) : turn
              board.display
        end

        def play 
            puts "#{current_player}, choose a space from 1-9:"
            until over?
                turn 
            end
            puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
        end
end

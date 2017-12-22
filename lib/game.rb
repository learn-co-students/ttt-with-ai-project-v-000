class Game

attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [ #lists all possible winning combinations of tic tac toe
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
        def initialize(player_1 = "O", player_2 = "X", board = Board.new)
          @player_1 = player_1
          @player_2 = player_2
          @board = board
        end

        def current_player
          turn_count.even? ? "X" : "O"
          #returns the correct player, X, for the third move
        end

        def over?
          #returns true for a draw
          #returns true for a won game
          #returns false for an in-progress game
          won? || draw?
        end

        def won?
          #returns false for a draw
          #returns the correct winning combination in the case of a win
          #returns false for an in-progress game
          WIN_COMBINATIONS.any? do |combo|
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
          end
          end
          end

          def draw
            #returns true for a draw
            #returns false for a won game
            #returns false for an in-progress game
          full? && !won?
          end

          def winner
            #returns X when X won
            #returns O when O won
            #returns nil when no winner
            if combo = won?
                  @board[combo[0]]
                end
          end

          def turn
          # makes valid moves
          #asks for input again after a failed validation
          #changes to player 2 after the first turn
          puts "Please enter a number (1-9):"
          user_input = gets.strip
          index = input_to_index(user_input)
          if valid_move?(index)
            token = current_player
            move(index, token)
          else
            turn
          end
          display_board
          end

          def play
            turn until over?
            puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
            end
  



end # end class

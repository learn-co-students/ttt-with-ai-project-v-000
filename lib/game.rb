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
        def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
          @player_1 = player_1
          @player_2 = player_2
          @board = board
        end

        def current_player
          @board.turn_count % 2 == 0 ? @player_1 : @player_2
          #returns the correct player, X, for the third move
        end

        def over?
          #returns true for a draw
          #returns true for a won game
          #returns false for an in-progress game
          won? || draw?
        end

                  def play
              while !over?
                turn
              end
              if won?
                puts "Congratulations #{winner}!"
              elsif draw?
                puts "Cat's Game!"
              end
            end

            def won?
            #returns false for a draw
            #returns the correct winning combination in the case of a win
            #returns false for an in-progress game
            WIN_COMBINATIONS.detect do |combo|
            @board.cells[combo[0]] == @board.cells[combo[1]] &&
            @board.cells[combo[1]] == @board.cells[combo[2]] &&
            @board.taken?(combo[0]+1)
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
            if winning_combo = won?
              @winner = @board.cells[winning_combo.first]
            end
          end

          def turn
          # makes valid moves
          #asks for input again after a failed validation
          #changes to player 2 after the first turn
          player = current_player
      current_move = player.move(@board)
      if !@board.valid_move?(current_move)
        turn
      else
        puts "Turn: #{@board.turn_count+1}\n"
        @board.display
        @board.update(current_move, player)
        puts "#{player.token} moved #{current_move}"
        @board.display
        puts "\n\n"
      end
    end

    def draw?
        @board.full? && !won? #returns true for a draw, false otherwise
      end


end # end class

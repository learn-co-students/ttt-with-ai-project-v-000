require 'pry'

class Game 
    attr_accessor :board, :player_1, :player_2

    # INITIALIZE
    # Every new game gets a new board and 2 human players (players 1 and 2 which have default values of "X" and "O".
    #Players::Human.new("X") calls on the Players module and asks player to make a move and then returns it as a string (chomp)
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7], [2,5,8], [0,4,8], [6,4,2]
    ]
    
    # CURRENT_PLAYER returns the correct player based on fact that player 1 is an odd number. We use modulo to see which player is odd or even
    def current_player
        board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    # WON?
    def won?
        # searchiterates over board to detect a WIN_COMBINATIONS match. 
        # we increment by 1 to the next array in WIN_COMBINATIONS until we DETECT a match.
        WIN_COMBINATIONS.detect do |win_combo|
          @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
          @board.cells[win_combo[1]] == @board.cells[win_combo[2]] && 
          @board.taken?(win_combo[0] + 1)
        end
    end

    # WINNER
    # check the board to see if game has been won and if so find and show the winning combination and token.
    def winner
       if won?
            @board.cells[won?[0]]
       else
            nil
       end
    end

    # DRAW? If board is full and no winner, it's a draw
    def draw?
       @board.full? && !won? 
    end

    # OVER
    # game is over if there is a draw or if someone has won.
    def over?
        draw? || won?
    end

    # TURN
    def turn
        # assign current_player.move(@board) to variable 'current_move'
        # #current_player's choice of move gets validated through #valid_move
        current_move = current_player.move(board)
        #if the #move isn't a #valid_move, execute #turn again and ask player for another choice between 1 - 9. This is recursive, and continues until a #valid_move is made.
        if !board.valid_move?(current_move)
            turn
            # when a #valid_move is made, execute what's below. 
        else
            #
            puts "Turn: #{board.turn_count+1}\n"
                board.display
             board.update(current_move, current_player)
            puts "#{current_player.token} moved #{current_move}\n"
             board.display
            puts "\n\n"
        end
    end

    # PLAY
    # continue to play by executing #turn until game is #over and if someone has won, puts a "congratulations". Or if #draw, puts "Cat's game"
    def play 
        until over?
        turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end
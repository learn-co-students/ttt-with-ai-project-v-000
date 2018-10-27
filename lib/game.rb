require 'pry'

class Game 
    attr_accessor :board, :player_1, :player_2

    #----WIN_COMBINATIONS---------------
       WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], [0,3,6],[1,4,7], [2,5,8], [0,4,8], [6,4,2]
    ]
    
    # --INITIALIZE--
    # new games gets a new board and 2 human players with default values of "X" and "O".
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    #-----START---------------
    def start
        puts "Welcome to Tic Tac Toe!"
        puts "How many players?"
        input = gets.strip.to_i
        
        # 1 == HUMAN  against a COMPUTER.
        if input == 1
          puts "Who wants to go first, human or computer?"
          input2 = gets.strip

          if input2 == "human"
            new_game = Game.new(@player_1 = Players::Human.new("X"), @player_2 = Players::Computer.new("O"), @board)
            new_game.play
          else
            input2 == "computer"
            new_game = Game.new(@player_1 = Player::Computer.new("X"), @player_2 = Players::Human.new("O"), @board)
            new_game.play
          end
        
          # 2 == two HUMAN players
        elsif input == 2
           new_game = Game.new(@player_1 = Players::Human.new("X"), @player_2 = Players::Human.new("O"), @board)
           new_game.play

        # 0 == COMPUTER against COMPUTER.
        elsif input == 0
            new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
            new_game.play
        end    
    end

     # -----PLAY----------------
    # continue with #turn until game is #over by #draw or #won
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

    # -----CURRENT_PLAYER-----------
    # returns the correct player. We use modulo to see which player is odd or even
    def current_player
        board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    #-------TURN-----------
    def turn
        player_current = current_player
        current_move = current_player.move(board)
        
        if !board.valid_move?(current_move)
            turn
            # when a #valid_move is made, execute what's below. 
        else
            #
            puts "Turn: #{board.turn_count+1}\n"
                board.display
             board.update(current_move, current_player)
            puts "#{player_current.token} moved #{current_move}\n"
             board.display
            puts "\n\n"
        end
    end

     #------WON?----------
    # iterates over board to detect a WIN_COMBINATIONS match and increments by 1 to the next array in WIN_COMBINATIONS until we DETECT a match.
    def won?
        WIN_COMBINATIONS.detect do |win_combo|
          @board.cells[win_combo[0]] == @board.cells[win_combo[1]] &&
          @board.cells[win_combo[1]] == @board.cells[win_combo[2]] && 
          @board.taken?(win_combo[0] + 1)
        end
    end

    # -----DRAW?---------
    # if board is full and no winner, it's a draw
    def draw?
        @board.full? && !won? 
     end

    #-----OVER----------
    # game is over if there is a draw or if someone has won.
    def over?
        draw? || won?
    end

    #----WINNER--------------
    # check board to see if game has been won. If so, winning comb and winning token.
    def winner
       if won?
            @board.cells[won?[0]]
       else
            nil
       end
    end

end
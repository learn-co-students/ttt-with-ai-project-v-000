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
        [6,4,2]
    ]

    def initialize(play1 = Players::Human.new("X"), play2 = Players::Human.new("O"), board=Board.new)
        @board = board
        @player_1=play1
        @player_2=play2
    end

    def current_player
        @board.turn_count.even? ? @player_1 : @player_2
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
          @board.cells[combo[0]] == @board.cells[combo[1]] &&
          @board.cells[combo[0]] == @board.cells[combo[2]] &&
          @board.taken?(combo[0] + 1)
          #Last part checks to make sure spot is taken by an actual player
        end
        #returns the winning combination, too
    end

    def draw?
        board.full? && !won?
    end

    def over?
        draw? || won?
    end

    def winner
      if won = won?
      #Using variable assignment as a condition!
      #if the assignment occurs properly (not nul) the condition is true
      #if the assignment is to a nul value, the if statement aborts
        board.cells[won.first]
      end
    end


    def top
      puts "Welcome to Tic-Tac-Toe (Object-Oriented Version)"
      puts "======================"
    end

    def turn
        x =""
        until @board.valid_move?(x) do

            if current_player==player_1
                x=player_1.move(@board)
            else
                x=player_2.move(@board)
            end
        end
        @board.update(x,current_player)
        system "clear"
        top
        @board.display
    end

    def play
        @board.display
        until over?
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cats Game!"
        end
    end

end

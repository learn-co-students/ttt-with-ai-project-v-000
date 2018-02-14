class Game
  attr_accessor :board, :player_1, :player_2

        WIN_COMBINATIONS = [
          [0,1,2],
          [3,4,5],
          [6,7,8],
          [0,4,8],
          [2,4,6],
          [0,3,6],
          [2,5,8],
          [1,4,7]
        ]

        def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new )
          @player_1 = player_1
          @player_2 = player_2
          @board = board
        end


        def current_player
          #condition ? return value if true : return value
          @board.turn_count.even? ? @player_1 : @player_2
          #modulo
        end

        def over?
           self.draw? || self.won?
        end

        def won?
            WIN_COMBINATIONS.detect do |possible|
               #possible here indicate the possible wins that can occur And it is what we iterate over..
               #   .cells indicateing each individual cells targeting whats in that cells.
               # Also we want to keep it between 1-9
          if @board.taken?(possible[0] +1) && @board.cells[possible[0]] == @board.cells[possible[1]] && @board.cells[possible[0]] == @board.cells[possible[2]]
             possible
          end
          end
        end

         def  draw?
          if  @board.full? && !won?
              true
          end
         end

        def winner
         if  person1 = won?
           board.cells[person1[0]] # cells is in the board class..and it we named it with attr_accessor
         end
        end

       def turn
      #check if move is valid
          stored_move = current_player.move(board)
        if board.valid_move?(stored_move)
          board.update(stored_move, current_player)
        else
          turn  # it called recursion... call a method inside of itself.
        end
     end

    def play
       while !over?
         turn
        end

         if won?
          puts "Congratulations #{winner}!"  #when you doing CLI... You must puts out the information.
        else
          puts "Cat's Game!"
        end
    end
end

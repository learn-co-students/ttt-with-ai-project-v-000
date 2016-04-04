require 'pry'
class Game

    attr_accessor :board,:player_1, :player_2 #

    WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
      ]

    def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)

        # board = [" "," "," "," "," "," "," "," "," "]
        #@board = Board.new
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    # def board #(board, player_1="X", player_2="O")
    #     # game(board, player_1="X", player_2="O") = Board.new
    #     #Board.new
    #     @board = []
    # end

      def current_player
         if @board.turn_count % 2 == 0
             player_1
         else
             player_2
         end
      end

      def over?
          board.full? || won? || draw?
      end

      def won?
          WIN_COMBINATIONS.detect do |win|
#binding.pry
              @board.cells[win[0]] == @board.cells[win[1]] and
              @board.cells[win[1]] == @board.cells[win[2]]
          end
        #   binding.pry
      end


      def draw?
          board.full? && !won?
        #   binding.pry
      end



      def winner
          xcount = 0
          ocount=0
          @board.cells.each do |c|
              if c == "X"
                  xcount +=1
              elsif c == "O"
                  ocount += 1
              end
          end
          if xcount > ocount
              "X"
            #   return "X"
            #   return "X is the winner!"
          elsif ocount > xcount
            #   return "O"
                "O"
            #   return "O is the winner!"
          else
              nil
            #   return nil
          end
      end


    def turn
        player = current_player
        move = player.move(@board)
        # if valid_move?(move)
        # turn
        #     if valid_move?(move)
        #         turn
        #     else
        # # else
        #     puts "Invalid Move. Try again."
        # end
        # board.position(pos)
        # board.valid_move?(pos)
    end





    def play
        # gets "Where do you want to go?"
        # while !over?
        #     turn
        # end
        if won?
            # puts "Congratulations, #{winner}!"
            if winner == "X"
                puts "Congratulations X!"
            elsif winner == "O"
                puts "Congratulations O!"
            end
        elsif draw?
            puts "Cats Game!"

        end
    end  #play
end  #class
binding.pry

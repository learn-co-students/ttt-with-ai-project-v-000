require 'pry'
require 'set'

class Game

    attr_accessor :board, :player_1, :player_2
   
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @board = board
        @player_1 = player_1
        @player_2 = player_2
        
    end

    def winner
        won?
        @winner
    end

    def current_player
        if board.turn_count.even?
            @player_1
        else
            @player_2
        end
    end

    def over?
        won? || draw?
    end

    def won?
        x_indices = []
        o_indices = []
        board.cells.each_with_index  {|cell, i| if cell == "X" then x_indices << i end}
        board.cells.each_with_index  {|cell, i| if cell == "O" then o_indices << i end}

        WIN_COMBINATIONS.each do |combo|


            if combo.all? {|index| x_indices.include?(index)}
                @winner = "X"
             #   binding.pry
                return true
            elsif combo.all? {|index| o_indices.include?(index)}
                @winner = "O"
         #      binding.pry
                return true
            end
        end
        false
    end
   


    def draw?
        !won? && board.turn_count == 9
    end


    def turn
        puts "#{current_player.token} ,it's your turn where do you want to put your next #{current_player.token}?"
          
        the_move = current_player.move     #   binding.pry
          if board.valid_move?(the_move)
             board.update(the_move, current_player)

      #     binding.pry
          else
              puts "invalid"
              turn
          end
          the_move
     
      #  end
    end



    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{@winner}!"
       #      binding.pry
        #      finish
      elsif draw?
        puts "Cat's Game!"
          #    finish
         #      binding.pry
      end
     #     binding.pry

    end

    def start
        play
    end

    def finish
       # puts "Would you like to play another game? (y/n)"
       # if gets.chomp == "Y" || gets.chomp == "y"
       #     start
      #  end
    end

end

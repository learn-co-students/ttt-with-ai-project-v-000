require 'pry'
class Game
    
    attr_accessor :board, :player_1, :player_2, :cells

    WIN_COMBINATIONS = [[0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]]


   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    

    end


    def current_player
        board.turn_count.even? ? player_1 : player_2
     end
      
     def over?
        won? || draw?
    end

    def won?
            WIN_COMBINATIONS.each do |win|

            win_index_1 = win[0]
            win_index_2 = win[1]
            win_index_3 = win[2]

            position_1 = board.cells[win_index_1]
            position_2 = board.cells[win_index_2]
            position_3 = board.cells[win_index_3]

            if position_1 == "X"  && position_2 == "X" && position_3 == "X"
                return win
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return win
            end
            end
            false
     end

        def draw?
                if won? == false && board.full? == true
                    true
            end
        end

        def winner
            if combo = won?

                board.cells[combo[0]]
            end
            
        end
       
    
        def turn            
            player_turn = current_player.move(board)
            if board.valid_move?(player_turn)
                board.update(player_turn, current_player)
                board.display
            else
                puts "Space already taken! Try again!"
                turn
               
            end
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



        
        
        
    
end
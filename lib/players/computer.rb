require 'pry'

module Players

    class Computer < Player
        # BEST MOVE (center square)
        # computer == [4], human position == "5" 

        # SECOND_BEST_MOVES (corner squares)
        # computer == [0, 2, 6, 8], humman == "1", "3", "7" , "9"
      
        # LEAST_FAVORABLE_MOVES
        # computer == [1, 3, 5, 7], humman == "2", "4", "6" , "8"

          #---VALID_MOVE?-------
        # def valid_move?(input)
        #     input.to_i.between?(1,9) && !taken?(board)
        # end
        
        def move(board)
            squares = [[5],[1, 3, 7, 9], [2, 4, 6, 8]]
           
            best_move = "#{squares[0][0]}" 
            
            second_best_moves = "#{squares[1].sample}" 
            least_favorable_moves = "#{squares[2].sample}"
       
            if !board.taken?(best_move)
                best_move
            elsif !board.taken?(second_best_moves)
                second_best_moves
            else 
                "#{rand(1..9)}" 
            end
        end

  
      #   def move(board)
      #       squares = [[5],[1, 3, 7, 9], [2, 4, 6, 8]]
            
      #       #center square
      #       best_move = "#{squares[0][0]}" #using interpolation here is 
      #       #the same as converting to_s
      #       # corners
      #       second_best_moves = "#{squares[1].sample}" 
      #       least_favorable_moves = "#{squares[2].sample}"
       
      #       if !board.taken?(best_move)
      #           best_move
      #       elsif !board.taken?(second_best_moves)
      #           second_best_moves
      #       else 
      #           #----Third _MOVE----------
               
      #           def third_move(board)
      #               almost_winning_array = WIN_COMBINATIONS.detect do |win_combo|
      #               ((board.cells[win_combo[0]] == board.cells[win_combo[1]]) ||
      #               (board.cells[win_combo[1]] == board.cells[win_combo[2]]) ||
      #               (board.cells[win_combo[0]] == board.cells[win_combo[2]])) && 
      #               board.taken?(win_combo[0] + 1)
      #               end
              
      #           almost_winning_array.each do |position|
      #             binding.pry
      #               if !board.taken?(position)
      #                 return "#{position + 1}"
      #               end
      #             end 
      #           end
      #       third_move(board)
      #       end
      #   end

    end
end



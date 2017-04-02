module Players
  class Computer < Player

    WIN_COMBINATIONS = [[2,5,8], [3,5,7], [4,5,6], [1,5,9], [1,4,7], [1,2,3], [7,8,9], [3,6,9]]

    def move(board)
      #(1..9).to_a.sample.to_s
      if board.turn_count == 0
        one = [1, 3, 5, 7, 9].sample
        one.to_s       
      elsif board.turn_count == 1
      
      elsif board.turn_count == 2
        if one == 1
          three = [3,7].sample
        elsif one == 3
          three = [1,9].sample
        elsif one == 7
          three = [1,9].sample
        elsif one == 9
          three = [3,7].sample
        elsif one == 5
          second = board.find_index("O")
          if [2, 4, 6, 8].include?(second + 1)
            three = [3,7,9].sample
            three.to_s
          elsif (second + 1) == 1
            three = 9
          elsif (second + 1) == 3
            three = 7
          elsif (second + 1) == 7
            three = 3
          elsif (second + 1) == 9
            three = 1
          end   
        end
        three.to_s    
      elsif board.turn_count == 3
        
      elsif board.turn_count == 4
        if one == 1
          five = [3,7,9].sample
        elsif one == 3
          five = [1,7,9].sample
        elsif one == 7
          five = [1,3,9]
        elsif one == 9
          five = [1,3,7]
        elsif one == 5
          if [2,4,6,8].include?(second + 1)
            five = [1,3,7].sample
          elsif (second + 1) == 1
            five = [3,7].sample
          elsif (second + 1) == 3
            five = [1,9].sample
          elsif (second + 1) == 7
            five = [1,9].sample
          elsif (second + 1) == 9
            five = [3,7].sample
          end
        end
      end

        
      elsif board.turn_count == 5

      elsif board.turn_count == 6
        
      elsif board.turn_count == 7

      elsif board.turn_count == 8
        

        
      elsif
        
        
        
      
        
        
        
        
    end
  end
end
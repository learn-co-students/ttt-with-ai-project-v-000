module Players
  class Computer < Player

    WIN_COMBINATIONS = [[2,5,8], [3,5,7], [4,5,6], [1,5,9], [1,4,7], [1,2,3], [7,8,9], [3,6,9]]
    @@valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

    def defense
      WIN_COMBINATIONS.detect do |w|
        w.select {|a| board[a-1] == "O"}.length == 2
      end
    end
    
    def move(board)
      #(1..9).to_a.sample.to_s
      if board.turn_count == 0
        one = [1, 3, 5, 7, 9].sample
        one.to_s       
      elsif board.turn_count == 1
        first = board.cells.find_index("X") + 1
        if first == 5
          two = [1, 3, 7, 9].sample
        else
          two = 5
        end    
        two.to_s      
      elsif board.turn_count == 2
        second = board.cells.find_index("O") + 1
        if second == 5
          if one  == 1
            three = 9
          elsif one == 3
            three = 7
          elsif one == 7
            three = 3
          elsif one == 9
            three = 1
          end
        else
          if one == 1
            three = [3,7].sample
          elsif one == 3
            three = [1,9].sample
          elsif one == 7
            three = [1,9].sample
          elsif one == 9
            three = [3,7].sample
          elsif one == 5
            if [2, 4, 6, 8].include?(second)
              three = [3,7,9].sample
              three.to_s
            elsif (second) == 1
              three = 9
            elsif (second) == 3
              three = 7
            elsif (second) == 7
              three = 3
            elsif (second) == 9
              three = 1
            end 
          end  
        end
        three.to_s    
      elsif board.turn_count == 3
        if first == 5
          four = [1,3,7,9].sample
        else
          four = [2,4,6,8,].sample
        end
        four.to_s
      elsif board.turn_count == 4
        if second == 5 && [2,4,6,8].detect{|a|board[a] == "O"}
          o = WIN_COMBINATIONS.detect do |w|
            w.select {|a| board[a-1] == "O"}.length == 2
          end
          five = o.sample
        else
          if one == 1
            five = [3,7,9].sample
          elsif one == 3
            five = [1,7,9].sample
          elsif one == 7
            five = [1,3,9].sample
          elsif one == 9
            five = [1,3,7].sample
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
      five.to_s
      elsif board.turn_count == 5
        six = defense.sample
        six.to_s
      elsif board.turn_count == 6
        combo = WIN_COMBINATIONS.detect do |w|
          w.select {|a| board[a-1] == "X"}.length == 2
        end
        seven = combo.sample        
        seven.to_s
      elsif board.turn_count == 7
        eight = defense.sample
        eight.to_s
      elsif board.turn_count == 8
        nine = @@valid_moves.sample
        nine
      end
    end
  end
end
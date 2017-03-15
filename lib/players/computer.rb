module Players
  class Computer < Player

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

    def move(board)
      #Iterate through combos to see if there are any win combos with two identical tokens 
      #and an empty space
      WIN_COMBINATIONS.each do |combo|
        two_token_combo = []
        if (combo[0] == combo[1] && combo[2] == " ") || (combo[1] == combo[2] && combo[0] == " ") || (combo[0] == combo[2] && combo[1] == " ")
          two_token_combo << combo
          win_move
        else
          no_combos(board)
        end
      end
      #If there are no possible wins for either player, goto the no_combos method
        
    end

    def no_combos(board)
      #will try to take middle always if available, if not will try to take a corner next
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect do |i| 
          !board.taken?(i).to_s
        end
      end
    end

    def win_move
      two_token_combo.each do |combo| 
        if (combo[0] || combo[1] || combo[2]) == self.token
          combo.each do |cell|
            position = nil
            if cell == " "
              position << cell
              move = (position+1).to_s
            end
          end
        else 
          block_move
        end
      end
    end

    def block_move
      two_token_combo.each do |combo| 
        if (combo[0] || combo[1] || combo[2]) == !self.token
          combo.each do |cell|
            position = nil
            if cell == " "
              position << cell
              move = (position+1).to_s
            end
          end
        end
      end
    end
          

  end
end
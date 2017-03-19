module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [1,2,3], # Top row
      [4,5,6],  # Middle row
      [7,8,9],  # Bottom row
      [1,4,7],  # Left Column
      [2,5,8],  # Middle Column
      [3,6,9],  # Right Column
      [1,5,9],  # Diagnoal L to R
      [3,5,7]  # Diagnoal R to L
    ]

    def move(board)
      WIN_COMBINATIONS.each do |combo|
        two_token_combo = []
        if (combo[0] == combo[1] && combo[2] == " ") || (combo[1] == combo[2] && combo[0] == " ") || (combo[0] == combo[2] && combo[1] == " ")
          two_token_combo << combo
          win_move
        else
          no_combos(board)
        end
      end
    end

    def no_combos(board)
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

module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6], # left column
      [1,4,7], # middle column
      [2,5,8], # right column
      [0,4,8],
      [2,4,6]
    ]

    THREAT_COMBINATIONS = [
      [0,1], #TOP ROW
      [0,2],
      [1,2],
      [3,4], #MIDDLE ROW
      [3,5],
      [4,5],
      [6,7], #BOTTOM ROW
      [6,8],
      [7,8],
      [0,3], #LEFT COLUMN
      [0,6],
      [3,6],
      [1,4], #MIDDLE COLUMN
      [1,7],
      [4,7],
      [2,5], #RIGHT COLUMN
      [2,8],
      [5,8],
      [0,4], #diagonal 1
      [0,8],
      [4,8],
      [2,4], #diagonal 2
      [2,6],
      [4,6]
    ]

    THREAT_HASH = {
      [0,1,2] => [[0,1], [0,2], [1,2]],
      [3,4,5] => [[3,4], [3,5], [4,5]],
      [6,7,8] => [[6,7], [6,8], [7,8]],
      [0,3,6] => [[0,3], [0,6], [3,6]],
      [1,4,7] => [[1,4], [1,7], [4,7]],
      [2,5,8] => [[2,5], [2,8], [5,8]],
      [0,4,8] => [[0,4], [0,8], [4,8]],
      [2,4,6] => [[2,4], [2,6], [4,6]]
    }

    THREAT_MATRIX = [
      [[0,1], [0,2], [1,2]],
      [[3,4], [3,5], [4,5]],
      [[6,7], [6,8], [7,8]],
      [[0,3], [0,6], [3,6]],
      [[1,4], [1,7], [4,7]],
      [[2,5], [2,8], [5,8]],
      [[0,4], [0,8], [4,8]],
      [[2,4], [2,6], [4,6]]
    ]

    def move(board)
      possible_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      if board.valid_move?("5") then
        return "5"
      end

      turn = board.turn_count

      # if (turn.between?(1,2)) then
      #   possible_moves.shuffle.each do |move|
      #     if board.valid_move?(move) then
      #       return move
      #     end
      #   end
      # end

      if (turn.between?(0,2)) then
        corner_picked = false
        while corner_picked == false do
          try_corner = ["1", "3", "7", "9"].sample
          if board.valid_move?(try_corner) then
            return try_corner
            coerner_picked = true
          end
        end

        if corner_picked == true then
          possible_moves.each do |move|
            if board.valid_move?(move) then
              return move
            end
          end
        end
        # if board.valid_move?(1) then
        #   return "1"
        # elsif board.valid_move?(3) then
        #   return "3"
        # elsif board.valid_move?(7) then
        #   return "7"
        # elsif board.valid_move?(9) then
        #   return "9"
        # else
        #   possible_moves.each do |move|
        #     if board.valid_move?(move) then
        #       return move
        #     end
        #   end
        # end
      end #turns 1 through 3

      if (turn >= 3) then #turns 4+

        is_threatened = false

        if self.token == 'O' then #find the opponent's token
          opponent_token = 'X'
        else
          opponent_token = 'O'
        end
        # THREAT_HASH.each do |win_combo, threat_array|
        #     threat_array.each do |threat_combo|
        #       threat_check = [board.cells[threat_combo[0]], board.cells[threat_combo[1]]]
        #       if threat_check.all? {|player| player == opponent_token} then
        #           move = win_combo.reject{|position| position == threat_check[0] || position == threat_check[1]}[0]
        #           if board.valid_move?(move) then
        #             return move
        #           end
        #       end
        #
        #     end
        # end
        win_counter = 0
        lose_counter = 0
        THREAT_MATRIX.each do |threat_array| #check to see if we can win. If so, do it.
          threat_array.each do |threat_combo|
            threat_check = [board.cells[threat_combo[0]], board.cells[threat_combo[1]]]
            if threat_check.all? {|player| player == self.token} then
              move = WIN_COMBINATIONS[win_counter].reject{|position| position == threat_combo[0] || position == threat_combo[1]}
              input = move[0]
              input = input + 1 #make this a human-formatted move
              #puts "Computer has a chance to win at #{input} if move is valid!"
              if board.valid_move?(input) then
                puts "Moving my token #{self.token} to #{input} because I can win with #{threat_combo[0] + 1} and #{threat_combo[1] + 1}"
                return input
              end
            end
          end
        win_counter += 1
        end #THREAT_MATRIX.each do |threat_array|

        THREAT_MATRIX.each do |threat_array| #check to see if the opponent can win. If he can, block it.
          threat_array.each do |threat_combo|
            threat_check = [board.cells[threat_combo[0]], board.cells[threat_combo[1]]]
            #binding.pry
            if threat_check.all? {|player| player == opponent_token} then
              move = WIN_COMBINATIONS[lose_counter].reject{|position| position == threat_combo[0] || position == threat_combo[1]}
              input = move[0]
              input = input + 1
              if board.valid_move?(input) then
                return input
              end
            end
          end
        lose_counter += 1
        end #THREAT_MATRIX.each do |threat_array|

        #if we made it this far into the if, that means there's no immediate threat of victory. lets grab a random space
        possible_moves.each do |move|
          if board.valid_move?(move) then
            return move
          end
        end
      end #if (turn >= 5) then

      # if (turn >= 5) then
      #   threat_combos.each do |combo, value|
      # end
    end
  end
end

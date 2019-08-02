module Players
  class Computer < Player

    def move(board)
      win_combos = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
      ]

      lose_combos = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
      ]

      win_combos.each.with_index do |combination, i|
        win_combos[i][0] = self.token if board.position(combination[0] + 1) == self.token
        win_combos[i][1] = self.token if board.position(combination[1] + 1) == self.token
        win_combos[i][2] = self.token if board.position(combination[2] + 1) == self.token
      end

      self.token == "X" ? lose_token = "O" : lose_token = "X"

      lose_combos.each.with_index do |combination, i|
        lose_combos[i][0] = lose_token if board.position(combination[0] + 1) == lose_token
        lose_combos[i][1] = lose_token if board.position(combination[1] + 1) == lose_token
        lose_combos[i][2] = lose_token if board.position(combination[2] + 1) == lose_token
      end

      #play middle or corner
      if board.turn_count < 3
        if !board.taken?(5)
          return "5"
        elsif !board.taken?(1)
          return "1"
        elsif !board.taken?(3)
          return "3"
        elsif !board.taken?(7)
          return "7"
        elsif !board.taken?(9)
          return "9"
        end
      end

      #check for possible winning combinations
      if board.turn_count >= 3
        play_move = nil
        win_combos.each do |combo|
          if combo.count(self.token) == 2
            if (combo[0] == combo[1]) && !board.taken?(combo[2] + 1)
              play_move = combo[2] + 1
            elsif (combo[1] == combo[2]) && !board.taken?(combo[0] + 1)
              play_move = combo[0] + 1
            elsif (combo[0] == combo[2]) && !board.taken?(combo[1] + 1)
              play_move = combo[1] + 1
            end
          end
        end
        return play_move if !play_move.nil?
      end

      #check for possible losing combinations
      if board.turn_count >= 3
        play_move = nil
        lose_combos.each do |combo|
          if combo.count(lose_token) == 2
            if (combo[0] == combo[1]) && !board.taken?(combo[2] + 1)
              play_move = combo[2] + 1
            elsif (combo[1] == combo[2]) && !board.taken?(combo[0] + 1)
              play_move = combo[0] + 1
            elsif (combo[0] == combo[2]) && !board.taken?(combo[1] + 1)
              play_move = combo[1] + 1
            end
          end
        end
        return play_move if !play_move.nil?
      end

      #play any non-taken
      if play_move.nil?
        play_move = board.cells.find_index { |i| i == " " } + 1
      else
        play_move
      end
      play_move
    end

  end
end

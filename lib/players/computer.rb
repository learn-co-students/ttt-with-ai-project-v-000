

module Players

  class Computer < Player


    def move(board)
      sleep 1
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corner_moves = ["1", "3", "7", "9"]

      if board.turn_count == 0
        corner_moves.sample
      elsif !board.taken?("5")
        "5"
      elsif board.turn_count < 3
        corner_moves.select {|i| !board.taken?(i)}.sample
      # elsif board.turn_count == 3 &&
      elsif board.turn_count > 2
        Game::WIN_COMBINATIONS.detect do |combo|
          tokens = combo.collect {|i| board.position(i+1)}
          empty_space = tokens.count(" ")
          my_tokens = tokens.count(self.token)
          opp_tokens = 3 - tokens.count(self.token) - tokens.count(" ")
          if my_tokens == 2 && empty_space == 1
            combo.detect do |i|
              if board.position(i+1) == " "
                spot = i+1
                return spot.to_s
              end
            end
          elsif opp_tokens == 2 && empty_space == 1
            combo.detect do |i|
              if board.position(i+1) == " "
                spot = i+1
                return spot.to_s
              end
            end
          elsif board.turn_count == 3
            return corner_moves.select {|i| !board.taken?(i)}.sample
         end
        end
      end
    end

    end

  end





          # elsif my_tokens == 1 && empty_space == 2
          #   combo.detect do |i|
          #     if board.position(i+1) == " "
          #       spot = i+1
          #       return spot.to_s
          #     end
          #   end
          # elsif my_tokens == 1 && opp_tokens == 1 && empty_space == 1
          #   combo.detect do |i|
          #     if board.position(i+1) == " "
          #       spot = i+1
          #       return spot.to_s
          #     end
          #   end

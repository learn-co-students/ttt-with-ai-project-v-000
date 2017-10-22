module Players
  class Computer < Player
    CORNERS = [1,3,7,9]

    def move(board)
      next_move = nil
      if token == "O" && !board.taken?(5)
        next_move = 5
      end
      if !next_move
        Game::WIN_COMBINATIONS.detect do |combo|
          #check if you are one away from a win
          if combo.count{|i| board.position(i+1) == token} == 2 && combo.count{|i| !board.taken?(i+1)} == 1
            next_move = (combo.detect{|i| !board.taken?(i+1)}.to_i + 1).to_s
          end
        end
      end
      if !next_move
        Game::WIN_COMBINATIONS.detect do |combo|
          #check to block opponent if they are one away from a win
          if combo.count{|i| board.position(i+1) == opponent_token} == 2 && combo.count{|i| !board.taken?(i+1)} == 1
            next_move = (combo.detect{|i| !board.taken?(i+1)}.to_i + 1).to_s
          end
        end
      end
      #if they are not one away start to fill in 3 corners
      if !next_move && CORNERS.detect{|i| !board.taken?(i)}.to_s
        next_move = CORNERS.detect{|i| !board.taken?(i)}.to_s
      elsif !next_move
        next_move = [1,2,3,4,5,6,7,8,9].detect{|i| !board.taken?(i)}.to_s
      end
      next_move
    end

    def opponent_token
      token == "X" ? "O" : "X"
    end
  end
end

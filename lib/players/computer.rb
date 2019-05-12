module Players
  class Computer < Player
    def move(board)
      move = nil

      # if going first, move to the middle of the board, or if second, move to middle if position isn't taken.
      if !board.taken?(5)
        move = "5"

      # if going second, move to the bottom right corner of the board.
      elsif board.turn_count == 1
        move = "1"

      # if went first, and moved to the middle, take a positon in the corner.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      # if went second, all corner spots are taken, take a side position.
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"

      # Go through winning combos and see fill a spot that is a potential win for player.
      else
        Game::WIN_COMBINATIONS.detect do |cmb|

          # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If you can't play any winning moves, play a move to block the opponent from winning.
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        # If no two spots that could be potential winning combos are filled, take any available spots, but check corners and sides first
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end

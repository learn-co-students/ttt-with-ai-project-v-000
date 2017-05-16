module Players
  class Computer < Player
    def move(board)
      move = nil

      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
      if !board.taken?(5)
        move = "5"

      # If going second and the middle square is taken, take the upper-left corner square.
      elsif board.turn_count == 1
        move = "1"

      # If you went first (and took the middle), take a corner square with your second move.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

    

      #go through the WIN_COMBINATIONS arrayand check if any of the combinations have two squares filled with the same token and a third, empty square.
      else
        Game::WIN_COMBINATIONS.detect do |cmb|

          # check to see if game can be won
          if cmb.select{|i| board.position(i+1) == token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If cant win, check a way to block opponent from winning
          elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
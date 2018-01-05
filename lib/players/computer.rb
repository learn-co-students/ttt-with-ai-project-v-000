module Players

  class Computer < Player

    def move(board)
      move = nil

      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.

      if !board.taken?(5)
        move = "5"

        # If going second and the middle square is taken, take the upper-left corner square.

      elsif
        board.turn_count == 1
        move = "1"

         # If you went first (and took the middle), take a corner square with your second move.

      elsif
        board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i).to_s}

        # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.

      elsif
        board.turn_count == 3 && board.posiiton(1) == board.posiiton(9) || board.position(3) == board.position(9)
        move = "2"
      end

      # From here on, run through the WIN_COMBINATIONS array, checking whether any of the combinations have two squares filled with the same token and a third, empty square.

    else 
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select{|i| board.position(i+1) == token} 
        
      end
 end
end

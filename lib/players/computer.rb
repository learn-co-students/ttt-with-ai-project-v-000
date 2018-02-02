module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 0
        a = "5" #go to middle when board is empty
      elsif board.turn_count == 1 #if second player, first move: check if middle is occupied; if yes, go to corner cells.
        if !board.taken?("5")
          a = "5"
        else
          a = ["1","3","7","9"][rand(0..3)]
        end
      elsif board.turn_count == 2 #second move if AI went first (go to diagonal corner cell)
        a = ["1","3","7","9"].detect{|a|!board.taken?(a)} #occupy the corners whichever one was not occupied
      elsif board.turn_count == 3
        #second move when opponent went first: first check if opponent has a winning move, if yes, block; if no, then go for a winning move
        if (board.position(1) == board.position(9) || board.position(3) == board.position(7)) #if opponent occupied corners
          a = "5"
        elsif board.position.taken?("5") #check if the existing 2 moves by opponents is in the winning combo
          current_position = [1..9].select {|a|board.taken?(a.to_s)}
          current_position = current_position.collect {|a|a.to_s}
          current_position = current_position.delete_if{|s|board.positiion(s) == token} #current player's position index array
          Game::WIN_COMBINATIONS.detect do |cmb|
            if current_position.to_set.subset?(cmb.to_set) #opponent has 2 of the 3 winning positions - need to block
              a = cmb.detect {|a|!board.taken?(a)}
            else
              a = ["1","3","7","9"].detect{|a|!board.taken?(a)}
            end
          end
        end
      else # 4 moves and beyond: check if computer has winning move, if not, then check if opponent has winning move.
        current_computer_array = [1..9].select {|a|board.position(a.to_s) == token}
        current_computer_array = current_computer_array.collect{|a|a.to_s}
        current_opponent_array = [1..9].select {|a|board.position(a.to_s) != token && board.taken?(a.to_s)}
        current_opponent_array = current_opponent_array.collect{|a|a.to_s}
        Game::WIN_COMBINATIONS.detect do |cmb|
          if current_computer_array.to_set.subset?(cmb.to_set) #opponent has 2 of the 3 winning positions - need to block
            a = cmb.detect {|i|!board.taken?(i)}
          elsif current_opponent_array.to_set.subset?(cmb.to_set)
            a = cmb.detect {|i|!board.taken?(i)}
          end
        end
      end
    end
  end
end

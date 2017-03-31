module Players
  class Computer < Player
    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1 #which means 5 was taken, take the corner!
        move = "1"
      elsif board.turn_count == 2 #which means you took 5 with your first move, now take a corner!
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2" #If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
      else
        Game::WIN_COMBINATIONS.detect do |combo|
          #first, check whether you have any chances to win
          if combo.select {|i| board.position(i+1)==token}.size == 2 && combo.any?{|i| board.position(i+1)== " "}
            move = combo.detect{|i| !board.taken?(i+1)}.to_i.+(1).to_s
          #if you can't play any winning moves, play a move to block the opponent from winning.
          elsif combo.select {|i| board.position(i+1)!=token && board.position(i+1)!= " "}.size == 2 && combo.any?{|i| board.position(i+1)== " "}
            move = combo.detect{|i| !board.taken?(i+1)}.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end

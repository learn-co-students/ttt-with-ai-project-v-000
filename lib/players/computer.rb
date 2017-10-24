module Players
  class Computer < Player
    def move(board)
      move = nil

      # first move, take the middle square
      if !board.taken?(5)
        move = "5"

      # second move, take the top left corner
      elsif board.turn_count == 1
        move = "1"

      # third move, check top right and bottom left corner
      elsif board.turn_count == 2
        move = [3, 7].detect{|i| !board.taken?(i)}.to_s

      else
        Game::WIN_COMBINATIONS.detect do |combo|

          # Check if you have any chances to win
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          # If you can't win, jam the opponent
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        # If you can't find 2 tokens and an empty square in a winning combo, then
        # move to the first open square. check corners first, then sides.
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end

      move
    end
  end
end
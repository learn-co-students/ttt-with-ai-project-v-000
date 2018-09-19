require "pry"
module Players
  class Computer < Player

    def move(board)

      # When going first, take the middle square. When going second, take the middle square if it isn't yet taken.
      if !board.taken?(5)
        move = "5"

      # If going second and the middle square is taken, take the upper-left corner square.
      elsif board.turn_count == 1
        move = "1"

      # If you went first (and took the middle), take a corner square with your second move.
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      # If you went second (and took the middle) and the other player has occupied opposing corner squares, blow up the attempted trap by taking a side square.
      elsif board.turn_count == 3 && board.taken?(1) && board.position(1) == board.position(9) || board.turn_count == 3 && board.taken?(3) && board.position(3) == board.position(7)
        move = "2"

      else
        Game::WIN_COMBINATIONS.each do |combo|
          # First, check whether you have any chances to win, since it doesn't matter whether the opponent has a chance to win if you can win first.
          if combo.select{|i| board.position(i+1) != " " && board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            binding.pry

            # If you can't play any winning moves, play a move to block the opponent from winning.
          elsif  combo.select{|i| board.position(i+1) != " " && board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "} == false && combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            binding.pry
          end
        end

        # If none of the WIN_COMBINATIONS patterns have two squares taken by the same token and a third empty square, play into the first open square you find, first checking corners and then checking sides.
      move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil

      end
      move
    end

  end
end



module Players

  class Computer < Player



    def move(board)
      spot = nil
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corner_moves = ["1", "3", "7", "9"]
      cross_moves = ["2", "4", "6", "8"]
      if board.turn_count == 0
        corner_moves.sample
      elsif corner_moves.all? {|i| !board.taken?(i)} && board.turn_count == 1
         corner_moves.sample
      elsif !board.taken?("5")
        "5"
      elsif board.turn_count < 3
        corner_moves.select {|i| !board.taken?(i)}.sample
      elsif Game::WIN_COMBINATIONS
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select {|i| board.taken?(i+1) && board.position(i+1) == token}.count == 2
            spot = combo.select {|i| !board.taken?(i+1)}[0]

            spot = spot + 1
            return spot.to_s
          else
            binding.pry
            return valid_moves.select {|i| !board.taken?(i)}.sample
            end
          end
        end
      end
    end



end

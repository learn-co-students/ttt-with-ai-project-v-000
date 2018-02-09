

module Players

  class Computer < Player



    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      corner_moves = ["1", "3", "7", "9"]
      cross_moves = ["2", "4", "6", "8"]
      if board.turn_count == 0
        move = corner_moves.sample
      elsif corner_moves.all? {|i| !board.taken?(i)} && board.turn_count == 1
        corner_moves.sample
      elsif !board.taken?("5")
        "5"
      elsif Game::WIN_COMBINATIONS
        Game::WIN_COMBINATIONS.detect do |combo|
          binding.pry
          if combo.select {|i| board.taken?(i)}.count == 2 && combo.select{|i| board.position(i) == token}.count == 2

            combo.select {|i| !board.taken?(i+1)}



        end
        end
      end
    end

  end
end

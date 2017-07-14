module Players
  class Computer < Player
    def move(board)
      move = nil
      middle = "5"
      corners = ["1", "3", "7", "9"]
      edges = ["2", "4", "6", "8"]
      win_combos = Game::WIN_COMBINATIONS

      if board.valid_move?(middle)
        move = middle
      elsif board.turn_count == 1 || board.turn_count == 2
        move = corners.detect { |i| board.valid_move?(i) }
      #else

      end

    end
  end
end

#Game::WIN_COMBINATIONS.detect do |combo|

#end

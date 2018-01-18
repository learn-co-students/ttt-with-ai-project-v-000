module Players
  class Computer < Player


    def move(board)

      if board.turn_count == 0 && !board.taken?("5")
        "5"
     else
         ([*1..9] - [5]).sample
      end
    end


      #  Game::WIN_COMBINATIONS.detect do |elements|
      #  new_board = board.taken?(elements[0]) && board.taken?(elements[1]) || board.taken?(elements[0]) && board.taken?(elements[2]) || board.taken?(elements[1]) && board.taken?(elements[2])

  end
end

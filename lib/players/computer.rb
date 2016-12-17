module Players
  class Computer < Player



    def move(board)
      board.turn_count == 0
        
          if board.taken?("5")
            "1" || "2" || "3" || "4" || "6" || "7" || "8" || "9"
          else
            "5"
      end
    end

       #   Game::WIN_COMBINATIONS[1][1].to_s

       #  else
       #   Game::WIN_COMBINATIONS[0][0].to_s || Game::WIN_COMBINATIONS[0][2].to.s || Game::WIN_COMBINATIONS[1][0].to_s || Game::WIN_COMBINATIONS[1][2].to_s || Game::WIN_COMBINATIONS[2][0].to_s || Game::WIN_COMBINATIONS[2][2].to_s

      #  Game::WIN_COMBINATIONS.detect do |elements|
      #  new_board = board.taken?(elements[0]) && board.taken?(elements[1]) || board.taken?(elements[0]) && board.taken?(elements[2]) || board.taken?(elements[1]) && board.taken?(elements[2])



      #  random_no = board.cells.sample
      #    new_random_no = random_no.index(random_no)
      #     random = (new_random_no + 1)
          # if board.taken?(random)
          #   new_random_no
          # else
          #   board.update(random, self)
          # end




  end
end

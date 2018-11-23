module Players
  class Computer < Player
    def move(board)
      move = nil
      #{}"#{1 + Random.rand(9)}"
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "#{[1, 3, 7, 9].sample.to_s}"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
      elsif board.turn_count > 2
        Game::WIN_COMBINATIONS.detect do |combo|
            if board.cells[combo[0]] == board.cells[combo[1]] && board.taken?(combo[0] + 1)
              move = board.cells[combo[2]]
            elsif board.cells[combo[0]] == board.cells[combo[2]] && board.taken?(combo[0] + 1)
              move = board.cells[combo[1]]
            elsif board.cells[combo[1]] == board.cells[combo[2]] && board.taken?(combo[1] + 1)
              move = board.cells[combo[0]]
            elsif
              move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
            else
              move = "#{1 + Random.rand(9)}"
            end
          #end
        end
      end
    end
  end
end

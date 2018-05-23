module Players
  class Computer < Player
    def move(board)
      move = nil
      input = rand(1..9).to_s

      if !board.taken?(5)
        move = "5"
      elsif board.valid_move?(input)
        move = input
      elsif !board.valid_move?(input)
        move(board)
      elsif board.full?
        nil
      end
    end

    # def move(board)
    #   move = nil
    #   if (board.turn_count == 0 || board.turn_count == 1) && !board.taken?(5)
    #       --> don't need this because it would happen 1st round no matter what and nobody can win with only 1 move completed
    #     move = "5"
    #   end

    # if win_combinations is possible, 1 move off --> not sure how to state this in code
    #   move = index of open move to win  --> to either win or block
  end
end

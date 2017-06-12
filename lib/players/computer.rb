module Players

  attr_reader :board, :cells

  class Computer < Player

    def move(board)
      if board.valid_move?("5")
        move = "5"
      elsif board.turn_count == 1 || board.turn_count == 2 || board.turn_count == 3 || board.turn_count == 4
        move = [1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s
      elsif board.turn_count == 5 || board.turn_count == 6 || board.turn_count == 7 || board.turn_count == 8
        move = [2, 4, 6, 8].detect {|i| !board.taken?(i)}.to_s
      end
      move
    end
  end

end

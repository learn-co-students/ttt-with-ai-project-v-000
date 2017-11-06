module Players
  class Computer < Player


    # def move(board)
    #  move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect {|i| !board.taken?(i)}.to_s
    # end


    # def move(board)
    #   moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    #   moves.detect do |move|
    #     board.valid_move?(move)
    #   end
    #   move
    # end

    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif !board.taken?(3)
        move = "3"
      elsif !board.taken?(7)
        move = "7"
      else
        move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].detect{ |i| !board.taken?(i)}.to_s
      end
      move
    end

  end
end

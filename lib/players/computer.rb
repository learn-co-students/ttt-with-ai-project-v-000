module Players
  class Computer < Player

    def move(board)
      corners = [1, 3, 7 ,9]
      sides = [2, 4, 6, 8]

      if board.valid_move?(5)
        move = "5"
      elsif board.valid_move?(corners.join)
        move = corners.detect {|i| board.valid_move?(i)}.to_s
      elsif board.valid_move?(sides.join)
        move = sides.detect {|i| board.valid_move?(i)}.to_s
      else
        move = rand(1..9).to_s
      end
    end

  end
end

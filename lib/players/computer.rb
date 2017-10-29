module Players
  class Computer < Player
    #def move(board)
      # Random.rand(1..9).to_s
    #try to go for spaces in this order [1,3,9,2,6]
    #end

    def move(board)
      Random.rand(1..9).to_s
    end


    def random(board)
      Random.rand(1..9).to_s
    end

    def center(board)
      if board.valid_move?(5)
        "5"
      else
        random(board)
      end
    end

    def all_draw(board)
      if board.valid_move?(1)
        "1"
      elsif board.valid_move?(3)
        "3"
      elsif board.valid_move?(7)
        "7"
      elsif board.valid_move?(9)
        "9"
      else
        center(board)
      end
    end

  end
end

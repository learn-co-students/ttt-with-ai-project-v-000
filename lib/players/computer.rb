module Players
  class Computer < Player

  #corners are 1 ,3, 7, 9
  #middles are 2, 4, 6, 8

    def move(board)
      if board.valid_move?("5")
        "5"
      elsif [1,3,7,9].find {|p| board.valid_move?(p)}
        [1,3,7,9].find {|p| board.valid_move?(p)}[0]
      else
        [2,4,6,8].find {|p| board.valid_move?(p)}[0]
      end
    end

  end
end

module Players
  class Computer < Player

    def move(board)
      num = 5
        if board.valid_move?(num)
          num.to_s
        elsif
      num = rand(1..9)
      if board.valid_move?(num)
        num.to_s
      else
        move(board)
      end
    end
    num.to_s
  end


end
end

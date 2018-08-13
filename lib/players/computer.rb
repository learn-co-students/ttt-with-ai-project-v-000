module Players

  class Computer < Player

    def move(board)
      if board.turn_count == 0
        input = 1
        input.to_s if board.valid_move?(input)
      elsif board.turn_count == 2
        if board.valid_move?(3)
          input = 3
          input.to_s if board.valid_move?(input)
        elsif board.valid_move?(7)
          input = 7
          input.to_s if board.valid_move?(input)
        elsif board.valid_move?(9)
          input = 9
          input.to_s if board.valid_move?(input)
        else
          input = rand(1..9)
          input.to_s if board.valid_move?(input)
        end
      elsif board.turn_count == 4
        if board.valid_move?(2) && board.position(3) == "X"
          input = 2
          input.to_s if board.valid_move?(input)
        elsif board.valid_move?(4) && board.position(7) == "X"
          input = 4
          input.to_s if board.valid_move?(input)
        elsif board.valid_move?(5) && board.position(9) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.valid_move?(9) && (board.position(7) == "X" || board.position(3) == "X")
          input = 9
          input.to_s if board.valid_move?(input)
        else
          input = rand(1..9)
          input.to_s if board.valid_move?(input)
        end
      elsif board.turn_count == 6
        if board.position(7) == "X" && board.valid_move?(8) && board.position(9) == "X"
          input = 8
          input.to_s if board.valid_move?(input)
        elsif board.position(4) == "X" && board.valid_move?(5) && board.position(6) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.position(1) == "X" && board.valid_move?(2) && board.position(3) == "X"
          input = 2
          input.to_s if board.valid_move?(input)
        elsif board.position(1) == "X" && board.valid_move?(4) && board.position(7) == "X"
          input = 4
          input.to_s if board.valid_move?(input)
        elsif board.position(2) == "X" && board.valid_move?(5) && board.position(8) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.position(3) == "X" && board.valid_move?(6) && board.position(9) == "X"
          input = 6
          input.to_s if board.valid_move?(input)
        elsif board.position(3) == "X" && board.valid_move?(5) && board.position(7) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.position(1) == "X" && board.valid_move?(5) && board.position(9) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        else
          input = rand(1..9)
          input.to_s if board.valid_move?(input)
        end
      elsif board.turn_count == 8
        if board.position(7) == "X" && board.valid_move?(8) && board.position(9) == "X"
          input = 8
          input.to_s if board.valid_move?(input)
        elsif board.position(4) == "X" && board.valid_move?(5) && board.position(6) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.position(1) == "X" && board.valid_move?(2) && board.position(3) == "X"
          input = 2
          input.to_s if board.valid_move?(input)
        elsif board.position(1) == "X" && board.valid_move?(4) && board.position(7) == "X"
          input = 4
          input.to_s if board.valid_move?(input)
        elsif board.position(2) == "X" && board.valid_move?(5) && board.position(8) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.position(3) == "X" && board.valid_move?(6) && board.position(9) == "X"
          input = 6
          input.to_s if board.valid_move?(input)
        elsif board.position(3) == "X" && board.valid_move?(5) && board.position(7) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        elsif board.position(1) == "X" && board.valid_move?(5) && board.position(9) == "X"
          input = 5
          input.to_s if board.valid_move?(input)
        else
          input = rand(1..9)
          input.to_s if board.valid_move?(input)
        end
      else
        input = rand(1..9)
        input.to_s if board.valid_move?(input)
      end
    end
  end
end

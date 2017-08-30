module Players
  class Computer < Player

    def move(board)
      prng = Random.new
      user_input = prng.rand(9) + 1
      board.valid_move?(user_input) ? user_input.to_s : nil
    end

    def logical_move(board)
      #binding.pry
      case board.turn_count.even?
      when true
        if board.valid_move?("5")
          #binding.pry
          user_input = "5"
        elsif board.valid_move?("1")
          user_input = "1"
        elsif board.valid_move?("3")
          user_input = "3"
        elsif board.valid_move?("7")
          user_input = "7"
        elsif board.valid_move?("9")
          user_input = "9"
        else
          move(board)
        end
      when false
        move(board)
      end
    end
  end
end

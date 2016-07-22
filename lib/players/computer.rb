class Players
  class Computer < Player
    attr_accessor :board

    def move(board)
      if !board.taken?("5")
        "5"
      else
        best_move(board)
      end
    end

    def corner_move
      if !board.taken?("1")
        "1"
      elsif !board.taken?("3")
        "3"
      elsif !board.taken?("7")
        "7"
      elsif !board.taken?("9")
        "9"
      end
    end

    def best_move(board)
      corner_move || random #||win(board) || block(board)
    end

    def random
      number = rand 0..8
      number.to_s
    end

    def win(board)

    end

  end
end

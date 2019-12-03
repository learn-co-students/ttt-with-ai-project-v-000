require 'pry'

module Players
  class Computer < Player



    def move(board)
        input = nil
        if !board.taken?("4")
          input = "4"
        elsif !board.taken?("6")
          input = "6"
        elsif !board.taken?("2")
          input = "2"

      end
        input
      end
  end

end

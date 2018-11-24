require 'pry'

module Players
  class Computer < Player
    def move(board)
      #binding.pry
      # "1"
      board.cells[0] = 'X'
      # def check_if_free(user_input, board)
      #   board.taken?(user_input)
      # end

      # def first(user_input)
      #
      #   if taken?(user_input)
      #     board.cells[0] = 'x'|| board.cells[2] = 'x' || board.cells[6] = 'x' || board.cells[8] = 'x'
      #   end
      # end



    end
  end
end

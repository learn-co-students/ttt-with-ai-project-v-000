module Players

  class Computer < Player

    def move(board)
      p = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      p[rand(9)]
      # p.find do |x|
      #   if board.valid_move?(x)
      #     x
      #     binding.pry
      #   end
      # end
    end
  end
end

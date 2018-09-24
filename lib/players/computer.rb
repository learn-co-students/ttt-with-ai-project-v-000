module Players
  class Players::Computer < Player
    def move(board)
      computer_move = valid_move?(input)
    end
  end
end

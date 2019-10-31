module Players
  class Human < Player
    def move(board = Board.new)
      input = gets.strip
      input
    end
  end
end

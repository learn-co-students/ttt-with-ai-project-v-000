module Players
  class Human < Player


    def move(board)
      input = gets.strip
      board.valid_move?(input) != false ? input : input = gets.strip
    end
  end
end

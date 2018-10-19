module Players
  class Human < Player
    def move(board)
      input = gets.strip
      if board.valid_move?(input) != false
        input
      else
        puts "Seats taken'"
        input = gets.strip
      end
    end
  end
end

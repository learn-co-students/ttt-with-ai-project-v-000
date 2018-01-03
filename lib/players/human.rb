module Players
  class Human < Player

    def move(board)
      puts "Enter move"
      input = gets.chomp
      !board.valid_move?(input) ? self.move(board) : player_move = input
    end
  end
end

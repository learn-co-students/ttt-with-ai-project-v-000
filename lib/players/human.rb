module Players
  class Human < Player

    def move(board, game)
      puts "Please select a number."
      puts "The upper left is '1', the bottom right is '9'."
      input = gets
      until board.valid_move?(input)
        puts "Please select a number."
        puts "The upper left is '1', the bottom right is '9'."
        input = gets
      end
      input
    end

  end
end

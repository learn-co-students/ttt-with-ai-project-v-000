module Players
  class Human < Player # inherits from player
    def move(board)
      puts "Input a valid position from (1-9): "
      input = gets.strip

      until board.valid_move?(input)
        puts "Input a valid position (1-9): "
        input = gets.strip
      end
      input
    end
  end
end

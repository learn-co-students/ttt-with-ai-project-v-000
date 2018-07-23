module Players
  class Human < Player
    def move(board)
      puts "Input a valid position (1-9): "
      input = gets.strip
      until board.valid_move?(input)
        puts "Input a valid position (1-9): "
        input = gets.strip
      end
      board.update(input,self)
    end
  end
end

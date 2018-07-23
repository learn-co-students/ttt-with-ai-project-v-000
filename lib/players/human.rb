module Players
  class Human < Player
    def move(board)
      puts "Input a valid position (1-9): "
      input = gets.strip
    end
  end
end

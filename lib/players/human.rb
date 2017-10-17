module Players
  class Human < Player
    def move(board)
      puts "Player #{@token}, please enter a number from 1-9:"
      input = gets.strip
    end
  end
end

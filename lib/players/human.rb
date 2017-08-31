module Players
  class Human < Player

    def move(board)
      puts "Player #{@token}, please enter 1-9 to choose a spot on the board."
      gets.strip
    end

  end

end

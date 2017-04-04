module Players

  class Human < Player

    def move(board)
      input = gets.chomp
      puts input
      input
    end

  end
end

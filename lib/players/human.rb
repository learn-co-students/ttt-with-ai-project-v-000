module Players
  class Human < Player

    def move(board)
      puts "What's your move?"
      response = gets.chomp
    end

  end
end

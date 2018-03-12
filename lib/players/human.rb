module Players
  class Human < Player
    def move(board)
      puts "To execute your turn, please enter 1-9:"
      gets.chomp
    end
  end
end
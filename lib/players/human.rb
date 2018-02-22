module Players
  class Human < Player

    def move(board)
      puts "You're up! Where would you like to place your token?"
      board = gets.chomp
    end
  end
end

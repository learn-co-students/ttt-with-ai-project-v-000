module Players
  class Human < Player

    def move(board)
      puts "Enter your move 1 - 9"
      move = gets.chomp
    end
  end

end

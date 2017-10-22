module Players
  class Human < Player
    def move(board)
      puts "Enter a number from 1-9"
      gets.chomp
    end
  end
end

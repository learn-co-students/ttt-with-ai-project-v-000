module Players
  class Human < Player
    def move(board)
      puts "Enter an integer between 1-9"
      gets.chomp
    end
  end
end

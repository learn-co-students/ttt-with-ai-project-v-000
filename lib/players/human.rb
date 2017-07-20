module Players
  class Human < Player
    def move(board)
      puts "Please enter your move:"
      gets.chomp
    end
  end
end

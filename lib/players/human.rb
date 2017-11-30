module Players
  class Human < Player
    def move(board = nil)
      puts "Please enter your move:"
      input = gets.chomp
    end
  end
end

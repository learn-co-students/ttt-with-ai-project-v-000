module Players
  class Human < Player
    def move(board)
      puts "Enter input:"
      position = gets.chomp
    end
  end
end

module Players
  class Human < Player
    def move(board)
      puts "Enter input:"
      position = gets.chomp
      position
    end
  end
end

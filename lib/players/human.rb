module Players
  class Human < Player
    def move(board = nil)
      puts "Please enter 1 to 9:"
      position = gets.chomp
      position
    end
  end
end
